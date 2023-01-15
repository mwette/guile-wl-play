This project is work in progress.

guile-wl-play is a direct-to-prototol implementation for wayland clients

It is a work-in-progress.  I'm just trying to get my hands around
implementing the protocol and interacting with the server in Guile.

This uses fibers to run a cooperative sender, receiver and monitor.
The monitor is guile coop-server.  connect: "telnet localhost 37146"

Unfortunately, I can't do much right now on my Ubuntu 22.04 system:
I don't see how to generate a buffer to draw into and then display.

sockmsg.c	sendmsg and recvmsg! along with
		bytevector->cmsg-list cmsg-list->bytevector

wl-client.scm	support code
scanner		wayland client protocol code generator
code/*.scm	generated codes

wl07		demo program

