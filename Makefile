.PHONY: bld, clean
CC=clang
CFLAGS=-fPIC -g -D_DEFAULT_SOURCE -Wall -Werror -Wno-unused-variable -Wno-self-assign -lm -L vendor/libdill-2.14/.libs -ldill
INCLUDES=-I /home/khoda/sandbox/carp/core/
SHELL=bash

bld:
	carp -b --generate-only hello.carp
	$(CC) -o out/Hello $(INCLUDES) $(CFLAGS) out/main.c 

run:
	export LD_LIBRARY_PATH="vendor/libdill-2.14/.libs"; out/Hello

clean:
	rm -rf out

dill:
	mkdir -p vendor
	cd vendor \
	 && wget http://libdill.org/libdill-2.14.tar.gz \
	 && tar -xzf libdill-2.14.tar.gz \
	 && rm libdill-2.14.tar.gz
	 && cd libdill-2.14; ./configure; make CC=$(CC)
