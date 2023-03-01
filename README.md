This project is work in progress.

guile-wl-play is a direct-to-prototol implementation for wayland clients

It is a work-in-progress.  I'm just trying to get my hands around
implementing the protocol and interacting with the server in Guile.

This uses fibers to run a cooperative sender, receiver and monitor.
The monitor is guile coop-server.  connect: "telnet localhost 37146"

# requires guile-fibers and libcairo installed
# https://github.com/wingo/fibers

sockmsg.c	sendmsg and recvmsg! along with
		bytevector->cmsg-list cmsg-list->bytevector

mmap.c		mmap

wl-client.scm	support code
scanner		wayland client protocol code generator
code/*.scm	generated codes

demo/		old demo programs
demoNN		latest demo

I'm running on Ubuntu 22.10, which uses wayland by default (over X11)

formats:
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
