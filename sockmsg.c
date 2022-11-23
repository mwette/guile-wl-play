/* sockmsg.c - sendmsg() and recvmsg() support for Guile.  work in progress
 * potentially to be converted to patch for libguile/socket.c
 *
 * Copyright (C) 2022 Matthew Wette
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>
 *
 */


/* v221006a 

cmsgl is #(level type bv-data)

*/
#if 0
struct iovec {                    /* Scatter/gather array items */
  void  *iov_base;              /* Starting address */
  size_t iov_len;               /* Number of bytes to transfer */
};
struct msghdr {
  void         *msg_name;       /* Optional address */
  socklen_t     msg_namelen;    /* Size of address */
  struct iovec *msg_iov;        /* Scatter/gather array */
  size_t        msg_iovlen;     /* # elements in msg_iov */
  void         *msg_control;    /* Ancillary data, see below */
  size_t        msg_controllen; /* Ancillary data buffer len */
  int           msg_flags;      /* Flags on received message */
};
struct cmsghdr {
  size_t cmsg_len;    /* Data byte count, including header */
  int    cmsg_level;  /* Originating protocol */
  int    cmsg_type;   /* Protocol-specific type */
  unsigned char cmsg_data[];
};
#endif

#include <stdio.h>
#include <errno.h>
#include <unistd.h>

#include <string.h>
#include <sys/socket.h>
#include <libguile.h>

#ifndef MIN
#define MIN(A, B) ((A) < (B) ? (A) : (B))
#endif


#ifndef SCM_SYSCALL
/* from syscalls.h */
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

/* see also 
 *   https://git.gnunet.org/gnunet-scheme.git/tree/gnu/gnunet/util/cmsg.scm
 */

#define CMSG_SZ(cmsg) ((cmsg->cmsg_len) - sizeof(struct cmsghdr))

size_t
scm_c_cmsg_len (SCM cmsg)
{
  SCM bv;
  size_t ln;

  // SCM_ASSERT (scm_is_vector (cmsg), cmsg, 0, scm_c_cmsg_len);
  bv = scm_c_vector_ref (cmsg, 2);
  // SCM_ASSERT (scm_is_bytevector (bv), cmsg, 0, scm_c_cmsg_len);
  ln = CMSG_LEN (scm_c_bytevector_length (bv));
  return ln;
}

SCM_DEFINE(scm_cmsg_list_to_bytevector, "cmsg-list->bytevector", 1, 0, 0,
	   (SCM cmsgl),
	   "control message list to bytevector")
#define FUNC_NAME s_scm_cmsg_list_to_bytevector
{
  SCM ml, cm, bv, cb;
  size_t ln;
  struct cmsghdr *cmsg;

  for (ml = cmsgl, ln = 0; ml != SCM_EOL; ml = SCM_CDR (ml)) {
    cm = SCM_CAR (ml);
    ln += CMSG_ALIGN (scm_c_cmsg_len (cm));
  }

  bv = scm_c_make_bytevector (ln);

  cmsg = (struct cmsghdr *) SCM_BYTEVECTOR_CONTENTS (bv);
  memset(cmsg, 0, ln);
  for (ml = cmsgl, ln = 0; ml != SCM_EOL; ml = SCM_CDR (ml)) {
    cm = SCM_CAR (ml);
    cmsg->cmsg_len = scm_c_cmsg_len (cm);
    cmsg->cmsg_level = scm_to_int (scm_c_vector_ref (cm, 0));
    cmsg->cmsg_type = scm_to_int (scm_c_vector_ref (cm, 1));
    cb = scm_c_vector_ref (cm, 2);
    memcpy (CMSG_DATA(cmsg), SCM_BYTEVECTOR_CONTENTS (cb),
	    scm_c_bytevector_length (cb));
    cmsg = (struct cmsghdr *)((unsigned char *) cmsg
			      + CMSG_ALIGN (cmsg->cmsg_len));
  }

  return bv;
}
#undef FUNC_NAME

SCM_DEFINE(scm_bytevector_to_cmsg_list, "bytevector->cmsg-list", 1, 0, 0,
	   (SCM bv),
	   "extract cmsg-list from bytevector")
#define FUNC_NAME s_scm_bytevector_to_cmsg_list
{
  SCM res, bv1, ctl;
  struct msghdr *mhp;
  struct cmsghdr *cmsg;
  union { struct msghdr mh; double d; } x;

  mhp = &x.mh;
  
  SCM_VALIDATE_BYTEVECTOR (1, bv);
  mhp->msg_control = (struct cmsghdr *) SCM_BYTEVECTOR_CONTENTS (bv);
  mhp->msg_controllen = SCM_BYTEVECTOR_LENGTH (bv);

  res = SCM_EOL;
  for (cmsg = CMSG_FIRSTHDR (mhp); cmsg != NULL;
       cmsg = CMSG_NXTHDR (mhp, cmsg)) {
    ctl = scm_c_make_vector (3, SCM_BOOL_F);
    scm_c_vector_set_x (ctl, 0, scm_from_int (cmsg->cmsg_level));
    scm_c_vector_set_x (ctl, 1, scm_from_int (cmsg->cmsg_type));
    bv1 = scm_c_make_bytevector (CMSG_SZ (cmsg));
    memcpy(SCM_BYTEVECTOR_CONTENTS (bv1), CMSG_DATA (cmsg), CMSG_SZ (cmsg));
    scm_c_vector_set_x (ctl, 2, bv1);
    res = scm_cons(ctl, res);
  }
  res = scm_reverse_x (res, SCM_UNDEFINED);
  return res;
}
#undef FUNC_NAME


/*
  (sendmsg sock iobuf start count [control [flags]])
  iobuf is bytevector or vector of bytevectors
  ix is where to start in the first buffer
  control is bytevector (like output from cmsg-list->bytevector)
      or list (like input to cmsg-list->bytevector)
 */
SCM_DEFINE(scm_sendmsg, "sendmsg", 4, 2, 0,
           (SCM sock, SCM iobuf, SCM start, SCM count, SCM control, SCM flags),
           "returns nsent\n"
	   "on error, exception is raised")
#define FUNC_NAME s_scm_sendmsg
{
  SCM bv;
  int i, fd, nio, rv, fl;
  size_t ix, ln, ni;
  struct msghdr mh;

  SCM_VALIDATE_OPFPORT (1, sock);
  fd = SCM_FPORT_FDES (sock);

#if 0
  addr = scm_getsockname (sock);
  struct sockaddr *so_addr;
  size_t addr_size;
  so_addr = scm_to_sockaddr (addr, &addr_size);
  ...
  free(so_addr);
#endif
  mh.msg_name = 0;			/* assume connected */
  mh.msg_namelen = 0;			/* assume connected */

  ix = scm_to_size_t (start);
  ln = scm_to_size_t (count);

  if (scm_bytevector_p (iobuf)) {
    nio = 1;
    mh.msg_iov = alloca (nio*sizeof (struct iovec));
    mh.msg_iov[0].iov_base = SCM_BYTEVECTOR_CONTENTS (iobuf) + ix;
    mh.msg_iov[0].iov_len = ln;
  } else if (scm_vector_p (iobuf)) {
    nio = scm_c_vector_length (iobuf);
    mh.msg_iov = alloca (nio*sizeof(struct iovec));
    bv = scm_c_vector_ref (iobuf, 0);
    mh.msg_iov[0].iov_base = SCM_BYTEVECTOR_CONTENTS (bv) + ix;
    ni = MIN (ln, SCM_BYTEVECTOR_LENGTH (bv) - ix);
    mh.msg_iov[0].iov_len = ni;
    ln -= ni;
    for (i = 1; i < nio; i++) {
      bv = scm_c_vector_ref (iobuf, i);
      mh.msg_iov[i].iov_base = SCM_BYTEVECTOR_CONTENTS (bv);
      ni = MIN (ln, SCM_BYTEVECTOR_LENGTH (bv));
      mh.msg_iov[i].iov_len = ni;
      ln -= ni;
    }
  } else {
    ; // error
  }
  mh.msg_iovlen = nio;
     
  if (SCM_UNBNDP (control)) {
    mh.msg_control = NULL;
    mh.msg_controllen = 0;
  } else if (control == SCM_BOOL_F) {
    mh.msg_control = NULL;
    mh.msg_controllen = 0;
  } else if (scm_pair_p (control)) {
    bv = scm_cmsg_list_to_bytevector (control);
    mh.msg_control = SCM_BYTEVECTOR_CONTENTS (bv);
    mh.msg_controllen = SCM_BYTEVECTOR_LENGTH (bv);
  } else if (scm_bytevector_p (control)) {
    mh.msg_control = NULL;
    mh.msg_controllen = 0;
  } else {
    ;
  }

  mh.msg_flags = 0;			/* ignored */

  if (SCM_UNBNDP (flags))
    fl = 0;
  else
    fl = scm_to_int (flags);

  SCM_SYSCALL (rv = sendmsg(fd, &mh, fl));
  if (rv == -1) {
    if ((errno == EAGAIN) || (errno == EWOULDBLOCK))
      rv = 0;
    else 
      SCM_SYSERROR;
  }

  return scm_from_int (rv);
}
#undef FUNC_NAME

/*
  (recvmsg! sock iobuf [start [flags]] => #(nread cmsgs flags)
  nread # bytes read
  control is #f or a bytevector, if bytevector use (bv->cmsgl)
 */

SCM_DEFINE(scm_recvmsg_x, "recvmsg!", 2, 2, 0,
           (SCM sock, SCM iobuf, SCM start, SCM flags),
           "returns #(addr #(iov_len) ctll)\n"
	   "on error, exception is raised")
#define FUNC_NAME s_scm_recvmsg_x
{
  SCM bv, iolen, control, res;
  int i, fd, fl, nio, rv;
  size_t ix;
  struct msghdr mh;

  SCM_VALIDATE_OPFPORT (1, sock);
  fd = SCM_FPORT_FDES (sock);

  mh.msg_name = NULL;			/* assume connected */
  mh.msg_namelen = 0;			/* assume connected */
    
  if (SCM_UNBNDP (start))
    ix = 0;
  else
    ix = scm_to_size_t (start);
  
  if (scm_bytevector_p (iobuf)) {
    nio = 1;
    mh.msg_iov = alloca (nio*sizeof(struct iovec));
    mh.msg_iov[0].iov_base = (char*)SCM_BYTEVECTOR_CONTENTS (iobuf) + ix;
    mh.msg_iov[0].iov_len = SCM_BYTEVECTOR_LENGTH (iobuf) - ix;
    
  } else if (scm_vector_p (iobuf)) {
    nio = scm_c_vector_length (iobuf);
    mh.msg_iov = alloca (nio*sizeof(struct iovec));
    bv = scm_c_vector_ref (iobuf, i);
    mh.msg_iov[0].iov_base = SCM_BYTEVECTOR_CONTENTS (bv) + ix;
    mh.msg_iov[0].iov_len = SCM_BYTEVECTOR_LENGTH (bv) - ix;
    for (i = 1; i < nio; i++) {
      bv = scm_c_vector_ref (iobuf, i);
      mh.msg_iov[i].iov_base = SCM_BYTEVECTOR_CONTENTS (bv);
      mh.msg_iov[i].iov_len = SCM_BYTEVECTOR_LENGTH (bv);
    }
  } else {
    ; // error
  }
  mh.msg_iovlen = nio;

  mh.msg_control = alloca (512);	/* arbitrary size */
  mh.msg_controllen = 512;

  mh.msg_flags = 0;

  if (SCM_UNBNDP (flags))
    fl = 0;
  else
    fl = scm_to_int (flags);

  SCM_SYSCALL (rv = recvmsg(fd, &mh, fl));
  if (rv == -1) {
    if ((errno == EAGAIN) || (errno == EWOULDBLOCK))
      rv = 0;
    else 
      SCM_SYSERROR;
  }
  iolen = scm_from_int (rv);

  if (mh.msg_controllen > 0) {
    control = scm_c_make_bytevector (mh.msg_controllen);
    memcpy (SCM_BYTEVECTOR_CONTENTS (control),
	    mh.msg_control, mh.msg_controllen);
  } else {
    control = SCM_BOOL_F;
  }

  res = scm_c_make_vector (3, SCM_BOOL_F);
  scm_c_vector_set_x (res, 0, iolen);
  scm_c_vector_set_x (res, 1, control);
  scm_c_vector_set_x (res, 2, scm_from_int (mh.msg_flags));
  return res;
}
#undef FUNC_NAME



void
scm_init_sockmsg (void)
{
#ifdef SCM_RIGHTS
  scm_c_define ("SCM_RIGHTS", scm_from_int (SCM_RIGHTS));
#endif
#ifdef SCM_CREDENTIALS
  scm_c_define ("SCM_CREDENTIALS", scm_from_int (SCM_CREDENTIALS));
#endif

  scm_c_define_gsubr (s_scm_cmsg_list_to_bytevector, 1, 0, 0,
		      (scm_t_subr) scm_cmsg_list_to_bytevector);

  scm_c_define_gsubr (s_scm_bytevector_to_cmsg_list, 1, 0, 0,
		      (scm_t_subr) scm_bytevector_to_cmsg_list);

  scm_c_define_gsubr (s_scm_sendmsg, 4, 2, 0, (scm_t_subr) scm_sendmsg);

  scm_c_define_gsubr (s_scm_recvmsg_x, 2, 2, 0, (scm_t_subr) scm_recvmsg_x);
}

/* --- last line --- */
