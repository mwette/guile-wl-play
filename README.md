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
| scanne | wayland client protocol code generator |
| code/*.scm | generated code |
| demo/ | old demo programs |
| demoN | latest demo |

I'm running on Ubuntu 22.10, which uses wayland by default (over X11)
