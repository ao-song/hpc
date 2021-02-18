.PHONY: build clean

CC = gcc
CFLAGS = -c -fPIC
CSHARED = -shared
CDIR = c_src
FDIR = f_src
PYDIR = py_src
LIBDIR = lib
GFORTRAN = gfortran

build:
	mkdir -p $(LIBDIR)
	$(CC) $(CFLAGS) $(CDIR)/matrix.c -o $(LIBDIR)/matrix.o
	$(CC) $(LIBDIR)/matrix.o $(CSHARED) -o $(LIBDIR)/libmatrix.so
	$(GFORTRAN) $(FDIR)/*.f90 -o $(LIBDIR)/f_matrix.out

clean:
	rm -rf $(LIBDIR)/*.so $(LIBDIR)/*.o $(LIBDIR)/f_matrix.out
	rm matrix.mod
