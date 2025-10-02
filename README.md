# guile-wl-play 

This project is work in progress.

guile-wl-play is a direct-to-prototol implementation for wayland clients

I'm trying to get my hands around implementing the protocol and interacting 
with the server in Guile.

This package uses guile-fibers to run a cooperative sender, receiver 
and monitor.  The monitor is guile coop-server.  
To connect
```
$ telnet localhost 37146
```

## requirements

requires [guile-fibers](https://github.com/wingo/fibers) and libcairo

## manifest

| file | description |
| ---- | ----------- |
| sockmsg.c | sendmsg and recvmsg! along with bytevector->cmsg-list cmsg-list->bytevector |
| mmap.c | mmap |
| wl-client.scm | support code |
| scanner | wayland client protocol code generator |
| code/*.scm | generated protocol code |
| demo.old | old demo programs |
| demo | latest demo |
| ffi | FFI code for cairo |
| nyacc | support for ffi/cairo.scm from mwette/nyacc |

Last run on Ubuntu 25.04, which uses wayland by default (over X11)

