.PHONY: build clean

build:
	mkdir -p lib
	gcc -c -fPIC matrix.c -o lib/matrix.o
	gcc lib/matrix.o -shared -o lib/libmatrix.so

clean:
	rm -rf lib/*.so lib/*.o
