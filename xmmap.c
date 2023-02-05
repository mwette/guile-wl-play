/* xmmap.c - cobbled loadable until added to guile binary
 *
 */
#include <sys/mman.h>
#include <errno.h>
#include <stdlib.h>
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

/* coming patch for mmap.c: */

static void
xmmap_finalizer (void *ptr, void *data)
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

SCM_DEFINE (scm_xmmap_search, "xmmap/search", 2, 4, 0,
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
#define FUNC_NAME s_scm_xmmap_search
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
  scm_i_set_finalizer (SCM2PTR (bvec), xmmap_finalizer, (void*) c_len);
  return bvec;
}
#undef FUNC_NAME

SCM_DEFINE (scm_xmmap, "xmmap", 2, 4, 0,
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
#define FUNC_NAME s_scm_xmmap
{
  void *c_mem;
  size_t c_len;
  SCM bvec;

  bvec = scm_xmmap_search(addr, len, prot, flags, fd, offset);
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

SCM_DEFINE (scm_xmunmap, "xmunmap", 1, 0, 0,
            (SCM bvec),
	    "Given bytevector generated by mmap or mmap/search, unmap the\n"
            "the associated memory.  The argument will be modified to \n"
            "reflect a zero length bv. The return value is unspecified.\n"
            "Note that munmap is called by finalizer associated with\n"
            "bytevectors returned from mmap and mmap/search.\n")
#define FUNC_NAME s_scm_xmunmap
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
scm_init_xmmap(void) {
#ifdef PROT_READ
  scm_c_define ("PROT_READ", scm_from_int (PROT_READ));
#endif
#ifdef PROT_WRITE
  scm_c_define ("PROT_WRITE", scm_from_int (PROT_WRITE));
#endif
#ifdef MAP_SHARED
  scm_c_define ("MAP_SHARED", scm_from_int (MAP_SHARED));
#endif
  
  scm_c_define_gsubr (s_scm_xmmap, 2, 4, 0, (scm_t_subr) scm_xmmap);
}

/* --- last line --- */
