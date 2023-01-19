/* test sockmsg.c 
 *
 * $ gcc -g -o testmsgC testmsgC.c
 * $ ./testmsgC
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <sys/mman.h>
#include <string.h>

int main() {
  int sock, clnt, fd, res;
  char *path = "/var/tmp/abc";
  struct sockaddr_un addr;
  struct msghdr msg;
  struct iovec iov;
  struct cmsghdr *cm;
  ssize_t n;
  char buf[1024], cmbuf[64], *mbuf;

  unlink(path);

  //sock = socket(PF_UNIX, SOCK_STREAM | SOCK_CLOEXEC, 0);
  sock = socket(PF_UNIX, SOCK_STREAM | SOCK_CLOEXEC, 0);
  if (sock == -1) abort();

  memset(&addr, 0, sizeof(addr));
  addr.sun_family = AF_UNIX;
  strncpy((char * restrict)&addr.sun_path, path, sizeof(addr.sun_path)-1);

  res = bind(sock, (const struct sockaddr *) &addr, sizeof(addr));
  if (res == -1) abort();
  
  res = listen(sock, 2);
  if (res == -1) abort();

  while (1) {
    printf("waiting for conn\n");
    clnt = accept(sock, NULL, NULL);
    if (clnt == -1) abort();

    while (1) {
      iov.iov_base = buf;
      iov.iov_len = sizeof(buf);
      msg.msg_name = 0;
      msg.msg_namelen = 0;
      msg.msg_iov = &iov;
      msg.msg_iovlen = 1;
      msg.msg_control = cmbuf;
      msg.msg_controllen = sizeof(cmbuf);
      msg.msg_flags = 0;
      
      printf("waiting for mesg\n");
      n = recvmsg(clnt, &msg, sizeof(buf));
      if (n == -1) abort();

      if (msg.msg_controllen > 0) {
	cm = (struct cmsghdr *) &cmbuf;
	// res = mmap(...);
	if (cm->cmsg_level != SOL_SOCKET) abort();
	if (cm->cmsg_level != SCM_RIGHTS) abort();
	fd = *(int*)&cmbuf[sizeof(struct cmsghdr)];
	printf("fd=%d\n", fd);

	mbuf = mmap(0, 1024, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
	if (mbuf == (void *)-1) { printf("mmap\n"); fflush(stdout); abort(); }
	printf("%s\n", mbuf);
      }
    }
  }
  
}


/* --- last line --- */
