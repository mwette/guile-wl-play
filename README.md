This project is work in progress.

guile-wl-play is a direct-to-prototol implementation for wayland clients

It is a work-in-progress.  I'm just trying to get my hands around
implementing the protocol and interacting with the server in Guile.

This uses fibers to run a cooperative sender, receiver and monitor.
The monitor is guile coop-server.  connect: "telnet localhost 37146"

sockmsg.c	sendmsg and recvmsg! along with
		bytevector->cmsg-list cmsg-list->bytevector

xmmap.c		ugly hack for mmap, better one coming to guile

wl-client.scm	support code
scanner		wayland client protocol code generator
code/*.scm	generated codes

demo07		demo program
demo08		adding more structure, scrolled update

V0.10.0		first working release
V0.11.0		updated scanner, generates enums, added demo08

 1211384408
 1211384385
 1211388504
 1211388481
 808665688
 808665665
 808669784
 808669761
 909199186
 875709016
 875708993
 1
 0
