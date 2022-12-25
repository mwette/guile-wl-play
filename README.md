guile-wl-play is a direct-to-prototol implementation for wayland clients

It is a work-in-progress.  I'm just trying to get my hands around
implementing the protocol and interacting with the server in Guile.

This uses fibers to run a cooperative sender, receiver and monitor.
The monitor is guile coop-server.  connect: "telnet localhost 37146"

sockmsg.c	sendmsg and recvmsg! along with
		bytevector->cmsg-list cmsg-list->bytevector

wl-client.scm	support code
proto.scm	wayland client protocol code generator
wl-client-code.scm  code generated from wayland.xml

wl07		demo program

