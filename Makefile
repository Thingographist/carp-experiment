.PHONY: bld, cln
CC=clang
CFLAGS=-fPIC -g -D_DEFAULT_SOURCE -Wall -Werror -Wno-unused-variable -Wno-self-assign -lm -lpthread
INCLUDES=-I /home/khoda/sandbox/carp/core/
LIBS=vendor/libdill-2.14/.libs/libdill.a
SHELL=bash

bld:
	carp -b --generate-only hello.carp 
	$(CC) -o out/Hello $(INCLUDES) $(CFLAGS) out/main.c $(LIBS)

run:
	out/Hello

cln:
	rm -rf out

dill:
	mkdir -p vendor
	cd vendor \
	 && wget http://libdill.org/libdill-2.14.tar.gz \
	 && tar -xzf libdill-2.14.tar.gz \
	 && rm libdill-2.14.tar.gz \
	 && cd libdill-2.14; ./configure --disable-shared; make CC=$(CC)
