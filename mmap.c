/* mmap.c - cobbled loadable until added to guile binary
 *
 */
#include <stdio.h>
#include <sys/mman.h>
#include <errno.h>
#include <stdlib.h>
#include <unistd.h>
#include <gc/gc.h>
#include <libguile.h>

#define SIZEOF_OFF_T 8
#if SIZEOF_OFF_T == 4
# define scm_to_off_t scm_to_int32
#elif SIZEOF_OFF_T == 8
# define scm_to_off_t scm_to_int64
#endif

#ifndef SCM_SYSCALL
#define SCM_SYSCALL(line)                       \
  do                                            \
    {                                           \
      errno = 0;                                \
      line;                                     \
      if (errno == EINTR)                       \
        {                                       \
          scm_async_tick ();                    \
          errno = EINTR;                        \
        }                                       \
    }                                           \
  while (errno == EINTR)
#endif

#define SCM_BYTEVECTOR_SET_FLAG(bv, flag) \
  SCM_SET_BYTEVECTOR_FLAGS ((bv), SCM_BYTEVECTOR_FLAGS (bv) | flag)
#define SCM_BYTEVECTOR_SET_LENGTH(_bv, _len)            \
  SCM_SET_CELL_WORD_1 ((_bv), (scm_t_bits) (_len))
#define SCM_BYTEVECTOR_SET_CONTENTS(_bv, _contents)     \
  SCM_SET_CELL_WORD_2 ((_bv), (scm_t_bits) (_contents))
#define SCM_BYTEVECTOR_SET_PARENT(_bv, _parent) \
  SCM_SET_CELL_OBJECT_3 ((_bv), (_parent))

/* coming patch for mmap.c: */

#include <stdatomic.h>

static inline _Bool
scm_atomic_compare_and_swap_uint32 (uint32_t *loc, uint32_t *expected,
                                    uint32_t desired)
{
  atomic_uint_least32_t *a_loc = (atomic_uint_least32_t *) loc;
  return atomic_compare_exchange_weak (a_loc, expected, desired);
}

#include <errno.h>

static void
mmap_finalizer (void *ptr)
{
  size_t len;
  int rv;

  /* Guile's finalizer for scm_from_pointer only passes the pointer address,
   * so we don't have the size.   However, only the region starting at the
   * address is mapped, so if we include that it should all work out (we hope).
   */
  len = sizeof(void *);
  SCM_SYSCALL (rv = munmap(ptr, len));
  if (rv != 0)
    scm_misc_error ("mmap", "failed to munmap memory", SCM_EOL);
}

/* Code for scm_dynwind_acquire_port and release_port sourced from ports.c. */

#include <iconv.h>

typedef enum scm_t_port_type_flags {
  SCM_PORT_TYPE_NEEDS_CLOSE_ON_GC = 1 << 0
} scm_t_port_type_flags;

struct scm_t_port_type
{
  char *name;
  int (*print) (SCM exp, SCM port, scm_print_state *pstate);
  size_t (*c_read) (SCM port, SCM dst, size_t start, size_t count);
  size_t (*c_write) (SCM port, SCM src, size_t start, size_t count);
  SCM scm_read;
  SCM scm_write;
  int (*read_wait_fd) (SCM port);
  int (*write_wait_fd) (SCM port);
  scm_t_off (*seek) (SCM port, scm_t_off OFFSET, int WHENCE);
  void (*close) (SCM port);
  void (*get_natural_buffer_sizes) (SCM port, size_t *read_size,
                                    size_t *write_size);
  int (*random_access_p) (SCM port);
  int (*input_waiting) (SCM port);
  void (*truncate) (SCM port, scm_t_off length);
  unsigned flags;
  SCM input_class, output_class, input_output_class;
};

struct scm_t_port
{
  SCM file_name;
  SCM position;
  SCM read_buf;
  SCM write_buf;
  SCM write_buf_aux;
  size_t read_buffering;
  uint32_t refcount;
  uint32_t rw_random : 1;
  uint32_t at_stream_start_for_bom_read  : 1;
  uint32_t at_stream_start_for_bom_write : 1;
  SCM encoding;
  SCM conversion_strategy;
  SCM precise_encoding;
  iconv_t input_cd;
  iconv_t output_cd;
  SCM alist;
};

static void
release_port (SCM port)
{
  scm_t_port *pt = SCM_PORT (port);
  uint32_t cur = 1, next = 0;
  while (!scm_atomic_compare_and_swap_uint32 (&pt->refcount, &cur, next))
    {
      if (cur == 0)
        return;
      next = cur - 1;
    }
 if (cur > 1)
    return;

  if (SCM_PORT_TYPE (port)->close)
    SCM_PORT_TYPE (port)->close (port);

  /* Skip encoding code from ports.c! */
}

static void
scm_dynwind_acquire_port (SCM port)
{
  scm_t_port *pt = SCM_PORT (port);
  uint32_t cur = 1, next = 2;
  while (!scm_atomic_compare_and_swap_uint32 (&pt->refcount, &cur, next))
    {
      if (cur == 0)
        scm_wrong_type_arg_msg (NULL, 0, port, "open port");
      next = cur + 1;
    }
  scm_dynwind_unwind_handler_with_scm (release_port, port,
                                       SCM_F_WIND_EXPLICITLY);
}

SCM_DEFINE (scm_mmap_search, "mmap/search", 2, 4, 0,
            (SCM addr, SCM len, SCM prot, SCM flags, SCM file, SCM offset),
	    "Create a memory mapping, returning a bytevector.  @var{addr},\n"
	    "if non-zero, is the staring address; or, if zero, is assigned by\n"
	    "the system.  @var{prot}, if provided, assigns protection.\n"
	    "@var{file}, a port or fd, if provided associates the memory\n"
            "region with a file starting at @var{offset}, if provided.\n"
	    "The region returned by mmap WILL be searched by the garbage\n"
	    "collector for pointers.  See also mmap.  Note that the\n"
            "finalizer for the returned bytevector will call munmap.\n"
	    "Defaults for optional arguments are\n"
	    "@table @asis\n"
	    "@item prot\n(logior PROT_READ PROT_WRITE)\n"
	    "@item flags\n(logior MAP_ANONYMOUS MAP_PRIVATE)\n"
	    "@item fd\n-1\n"
	    "@item offset\n0\n"
	    "@end table")
#define FUNC_NAME s_scm_mmap_search
{
  void *c_mem, *c_addr;
  size_t c_len;
  int c_prot, c_flags, c_fd;
  scm_t_off c_offset;
  SCM pointer, bvec;

  if (SCM_POINTER_P (addr))
    c_addr = SCM_POINTER_VALUE (addr);
  else if (scm_is_integer (addr))
    c_addr = (void*) scm_to_uintptr_t (addr);
  else
    scm_misc_error ("mmap", "bad addr", addr);

  c_len = scm_to_size_t (len);

  if (SCM_UNBNDP (prot))
    c_prot = PROT_READ | PROT_WRITE;
  else
    c_prot = scm_to_int (prot);

  if (SCM_UNBNDP (flags))
    c_flags = MAP_ANONYMOUS | MAP_PRIVATE;
  else
    c_flags = scm_to_int (flags);

  scm_dynwind_begin (0);
  
  if (SCM_UNBNDP (file))
    c_fd = -1;
  else if (scm_is_integer (file))
    c_fd = scm_to_int (file);
  else
    {
      /* Use the fd of the port under clobber protection from concurrency.
         As scm_dynwind_acquire_port assumes that FILE is a port, check 
         that first. */
      SCM_VALIDATE_PORT (SCM_ARG5, file);
      scm_dynwind_acquire_port (file);
      c_fd = scm_to_int (scm_fileno (file));
    }

  if (SCM_UNBNDP (offset))
    offset = scm_from_int (0);
  c_offset = scm_to_off_t (offset);

  if ((c_addr == NULL) && (c_flags & MAP_FIXED))
    scm_misc_error ("mmap", "cannot have NULL addr w/ MAP_FIXED", SCM_EOL);

  SCM_SYSCALL (c_mem = mmap(c_addr, c_len, c_prot, c_flags, c_fd, c_offset));
  if (c_mem == MAP_FAILED)
    scm_syserror ("mmap");              /* errno set */

  /* The fd is free to go now. */
  scm_dynwind_end ();

  pointer = scm_from_pointer ((signed char *) c_mem, mmap_finalizer);
  bvec = scm_pointer_to_bytevector (pointer, len, offset,
				    scm_from_locale_symbol("vu8"));

  //util = VECTOR(2) off and len
  //scm_hash_set_x (mman_htab, util);

  return bvec;
}
#undef FUNC_NAME

SCM_DEFINE (scm_mmap, "mmap", 2, 4, 0,
            (SCM addr, SCM len, SCM prot, SCM flags, SCM file, SCM offset),
	    "Create a memory mapping, returning a bytevector.  @var{addr}, if\n"
	    "non-zero, is the staring address; or, if zero, is assigned by the\n"
	    "system.  @var{prot}, if provided, assigns protection.\n"
            "@var{file}, a port or fd, if provided associates the memory\n"
            "region with a file, starting at @var{offset}, if provided.\n"
	    "The region returned by mmap will NOT be searched by the garbage\n"
	    "collector for pointers. See also mmap/search.  Note that the\n"
            "finalizer for the returned bytevector will call munmap.\n"
	    "Defaults for arguments are:\n"
	    "@table @asis\n"
	    "@item prot\n(logior PROT_READ PROT_WRITE)\n"
	    "@item flags\n(logior MAP_ANONYMOUS MAP_PRIVATE)\n"
	    "@item fd\n-1\n"
	    "@item offset\n0\n"
	    "@end table")
#define FUNC_NAME s_scm_mmap
{
  void *c_mem;
  size_t c_len;
  SCM bvec;

  bvec = scm_mmap_search(addr, len, prot, flags, file, offset);
  c_mem = SCM_BYTEVECTOR_CONTENTS(bvec);
  c_len = SCM_BYTEVECTOR_LENGTH(bvec);

  /* Tell GC not to scan for pointers. */
  GC_exclude_static_roots(c_mem, (char*) c_mem + c_len);

  return bvec;
}
#undef FUNC_NAME

/* The following copied from bytevectors.c. Kludge? */
#define SCM_BYTEVECTOR_SET_LENGTH(_bv, _len)            \
  SCM_SET_CELL_WORD_1 ((_bv), (scm_t_bits) (_len))
#define SCM_BYTEVECTOR_SET_CONTENTS(_bv, _contents)	\
  SCM_SET_CELL_WORD_2 ((_bv), (scm_t_bits) (_contents))

SCM_DEFINE (scm_munmap, "munmap", 1, 0, 0,
            (SCM bvec),
	    "Given bytevector generated by mmap or mmap/search, unmap the\n"
            "the associated memory.  The argument will be modified to \n"
            "reflect a zero length bv. The return value is unspecified.\n"
            "Note that munmap is called by finalizer associated with\n"
            "bytevectors returned from mmap and mmap/search.\n")
#define FUNC_NAME s_scm_munmap
{
  void *addr;
  size_t len;
  int rv;

  SCM_VALIDATE_BYTEVECTOR (1, bvec);

  addr = (void *) SCM_BYTEVECTOR_CONTENTS (bvec);
  len = SCM_BYTEVECTOR_LENGTH (bvec);

  /* Invalidate further work on this bytevector. */
  SCM_BYTEVECTOR_SET_LENGTH (bvec, 0);
  SCM_BYTEVECTOR_SET_CONTENTS (bvec, NULL);

  SCM_SYSCALL (rv = munmap(addr, len));
  if (rv == -1)
    SCM_SYSERROR;			/* errno set */

  return SCM_UNSPECIFIED;
}
#undef FUNC_NAME

void
scm_init_mmap(void) {
  scm_add_feature("mman");

#ifdef PROT_NONE
  scm_c_define ("PROT_NONE", scm_from_int (PROT_NONE));
#endif
#ifdef PROT_READ
  scm_c_define ("PROT_READ", scm_from_int (PROT_READ));
#endif
#ifdef PROT_WRITE
  scm_c_define ("PROT_WRITE", scm_from_int (PROT_WRITE));
#endif
#ifdef PROT_EXEC
  scm_c_define ("PROT_EXEC", scm_from_int (PROT_EXEC));
#endif

#ifdef MAP_ANONYMOUS
  scm_c_define ("MAP_ANONYMOUS", scm_from_int (MAP_ANONYMOUS));
#endif
#ifdef MAP_ANON
  scm_c_define ("MAP_ANON", scm_from_int (MAP_ANON));
#endif
#ifdef MAP_FILE
  scm_c_define ("MAP_FILE", scm_from_int (MAP_FILE));
#endif
#ifdef MAP_FIXED
  scm_c_define ("MAP_FIXED", scm_from_int (MAP_FIXED));
#endif
#ifdef MAP_HASSEMAPHORE
  scm_c_define ("MAP_HASSEMAPHORE", scm_from_int (MAP_HASSEMAPHORE));
#endif
#ifdef MAP_PRIVATE
  scm_c_define ("MAP_PRIVATE", scm_from_int (MAP_PRIVATE));
#endif
#ifdef MAP_SHARED
  scm_c_define ("MAP_SHARED", scm_from_int (MAP_SHARED));
#endif
#ifdef MAP_NOCACHE
  scm_c_define ("MAP_NOCACHE", scm_from_int (MAP_NOCACHE));
#endif
  scm_c_define ("PAGE_SIZE", scm_from_int (sysconf (_SC_PAGESIZE)));
#ifdef MS_ASYNC
  scm_c_define ("MS_ASYNC", scm_from_int (MS_ASYNC));
#endif
#ifdef MS_SYNC
  scm_c_define ("MS_SYNC", scm_from_int (MS_SYNC));
#endif
#ifdef MS_INVALIDATE
  scm_c_define ("MS_INVALIDATE", scm_from_int (MS_INVALIDATE));
#endif
  
  scm_c_define_gsubr (s_scm_mmap, 2, 4, 0, (scm_t_subr) scm_mmap);
}

/* --- last line --- */
