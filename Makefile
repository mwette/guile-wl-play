# guile-wl-play/Makefile
#
# Copyright (C) 2022 Matthew Wette
#
# See LICENSE file distributed with this code.

CFLAGS = -g -I/opt/local/include/guile/3.0 -Wunused
#CFLAGS = -I/opt/local/include/guile/3.0
LIBS = -L/opt/local/lib -Wl,--rpath=/opt/local/lib -lguile-3.0

sockmsg.so: sockmsg.c
	$(CC) -shared -fPIC -o $@ $(CFLAGS) $^ $(LIBS)


wl-client-code.scm: wayland.xml proto.scm
	./proto.scm > wl-client-code.scm

# --- last line ---
