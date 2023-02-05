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

