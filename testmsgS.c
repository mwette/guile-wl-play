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
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>

int main() {
  int res;
  int sock, clnt, fd, flags;
  char *path = "/var/tmp/abc";
  char *file = "/etc/passwd";
  struct sockaddr_un addr;
  struct msghdr msg;
  struct iovec iov;
  struct cmsghdr *cm;
  struct stat filestat;
  ssize_t n;
  char buf[1024], cmbuf[64], *mbuf;

  unlink(path);

  sock = socket(PF_UNIX, SOCK_STREAM | SOCK_CLOEXEC, 0);
  if (sock == -1) abort();

  memset(&addr, 0, sizeof(addr));
  addr.sun_family = AF_UNIX;
  strncpy((char * restrict)&addr.sun_path, path, sizeof(addr.sun_path)-1);

  res = bind(sock, (const struct sockaddr *) &addr, sizeof(addr));
  if (res == -1) abort();
  
  res = listen(sock, 2);
  if (res == -1) abort();

  flags = 0;
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
      n = recvmsg(clnt, &msg, flags);
      if (n == -1) abort();

      if (msg.msg_controllen > 0) {
	printf("  got cm\n");
	cm = (struct cmsghdr *) &cmbuf;
	// res = mmap(...);
	if (cm->cmsg_level != SOL_SOCKET) abort();
	if (cm->cmsg_level != SCM_RIGHTS) abort();
	fd = *(int*)&cmbuf[sizeof(struct cmsghdr)];
	printf("fd=%d\n", fd);

	mbuf = mmap(0, 1024, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
	if (mbuf == (void *)-1) { printf("mmap\n"); fflush(stdout); abort(); }
	printf("%s\n", mbuf);
	close(fd);
      }

      if (1) {
	fd = open(file, O_RDONLY);
	printf("now send fd=%d\n", fd);
	res = stat(file, &filestat);
	if (res == -1) abort();
	mbuf = mmap(0, filestat.st_size, PROT_READ, MAP_SHARED, fd, 0);

	cm = (struct cmsghdr *) cmbuf;
	cm->cmsg_len = sizeof(struct cmsghdr) + sizeof(int);
	cm->cmsg_level = SOL_SOCKET;
	cm->cmsg_type = SCM_RIGHTS;
	memcpy(cmbuf + sizeof(struct cmsghdr), &fd, sizeof(int));

	iov.iov_base = buf;
	iov.iov_len = sizeof(buf);
	msg.msg_name = 0;
	msg.msg_namelen = 0;
	msg.msg_iov = &iov;
	msg.msg_iovlen = 1;
	msg.msg_control = cmbuf;
	msg.msg_controllen = cm->cmsg_len;
	msg.msg_flags = 0;
	
	res = sendmsg(clnt, &msg, 0);
	
	close(fd);
	munmap(mbuf, filestat.st_size);
      }
    }
  }
  
}


/* --- last line --- */
