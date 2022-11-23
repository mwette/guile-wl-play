
CFLAGS = -g -I/opt/local/include/guile/3.0 -Wunused
#CFLAGS = -I/opt/local/include/guile/3.0
LIBS = -L/opt/local/lib -Wl,--rpath=/opt/local/lib -lguile-3.0

sockmsg.so: sockmsg.c
	$(CC) -shared -fPIC -o $@ $(CFLAGS) $^ $(LIBS)

