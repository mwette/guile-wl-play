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

static void
mmap_finalizer (void *ptr, void *data)
{
  SCM bvec;
  void *c_addr;
  size_t c_len;
  int rv;

  bvec = SCM_PACK_POINTER (ptr);
  if (!SCM_BYTEVECTOR_P (bvec))
    scm_misc_error ("mmap", "expecting bytevector", SCM_EOL);

  c_addr = SCM_BYTEVECTOR_CONTENTS (bvec);
  c_len = SCM_BYTEVECTOR_LENGTH (bvec);
  SCM_SYSCALL (rv = munmap(c_addr, c_len));
  if (rv != 0)
    scm_misc_error ("mmap", "failed to munmap memory", SCM_EOL);
}

SCM_DEFINE (scm_mmap_search, "mmap/search", 2, 4, 0,
            (SCM addr, SCM len, SCM prot, SCM flags, SCM fd, SCM offset),
	    "Create a memory mapping, returning a bytevector..  @var{addr},\n"
	    "if non-zero, is the staring address; or, if zero, is assigned by\n"
	    "the system.  @var{prot}, if provided, assigns protection.\n"
	    "@var{fd}, if provided associates the memory region with a file\n"
	    "starting at @var{offset}, if provided.\n"
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

  if (SCM_UNBNDP (fd))
    c_fd = -1;
  else
    c_fd = scm_to_int (fd);

  if (SCM_UNBNDP (offset))
    c_offset = 0;
  else
    c_offset = scm_to_off_t (offset);

  if ((c_addr == NULL) && (c_flags & MAP_FIXED))
    scm_misc_error ("mmap", "cannot have NULL addr w/ MAP_FIXED", SCM_EOL);

  SCM_SYSCALL (c_mem = mmap(c_addr, c_len, c_prot, c_flags, c_fd, c_offset));
  if (c_mem == MAP_FAILED)
    scm_syserror ("mmap");              /* errno set */

  pointer = scm_cell (scm_tc7_pointer, (scm_t_bits) c_mem);
  bvec = scm_c_take_typed_bytevector((signed char *) c_mem + c_offset, c_len,
				     SCM_ARRAY_ELEMENT_TYPE_VU8, pointer);
  scm_i_set_finalizer (SCM2PTR (bvec), mmap_finalizer, (void*) c_len);
  return bvec;
}
#undef FUNC_NAME

SCM_DEFINE (scm_mmap, "mmap", 2, 4, 0,
            (SCM addr, SCM len, SCM prot, SCM flags, SCM fd, SCM offset),
	    "Create a memory mapping, returning a bytevector.  @var{addr}, if\n"
	    "non-zero, is the staring address; or, if zero, is assigned by the\n"
	    "system.  @var{prot}, if provided, assigns protection.  @var{fd},\n"
	    "if provided associates the memory region with a file, starting \n"
	    "at @var{offset}, if provided.\n"
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

  bvec = scm_mmap_search(addr, len, prot, flags, fd, offset);
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

#ifdef HAVE_MSYNC
SCM_DEFINE (scm_msync, "msync", 2, 0, 0,
            (SCM bvec, SCM flags),
	    "Flush changes made to the in-core copy of a file mapped using\n"
            "mmap or mmap/search.  This should be executed on modified memory\n"
            "before calling munmap.  The @var{flags} argument must be exactly\n"
            "one of the following:\n"
            "@table @code\n"
            "@item MS_ASYNC\n"
            "Initiate update, return immediately.\n"
            "@item MS_SYNC\n"
            "Initiate update, block until complete.\n"
            "@item MS_INVALIDATE\n"
            "Invalidate other mappings of the same file.\n"
            "@end table\n"
            "The return value is unspecified.")
#define FUNC_NAME s_scm_msync
{
  void *addr;
  size_t len;
  int c_flags, rv;

  SCM_VALIDATE_BYTEVECTOR (1, bvec);
  addr = (void *) SCM_BYTEVECTOR_CONTENTS (bvec);
  len = SCM_BYTEVECTOR_LENGTH (bvec);

  c_flags = scm_to_int (flags);

  SCM_SYSCALL (rv = msync(addr, len, c_flags));
  if (rv == -1)
    SCM_SYSERROR;			/* errno set */

  return SCM_UNSPECIFIED;
}
#undef FUNC_NAME
#endif /* HAVE_MSYNC */

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
