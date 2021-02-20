.PHONY: build clean

CC = gcc
CFLAGS = -c -fPIC
CSHARED = -shared
CDIR = c_src
FDIR = f_src
PYDIR = py_src
LIBDIR = lib
BINDIR = bin
GFORTRAN = gfortran

part1:
	mkdir -p $(LIBDIR)
	$(CC) $(CFLAGS) $(CDIR)/matrix.c -o $(LIBDIR)/matrix.o
	$(CC) $(LIBDIR)/matrix.o $(CSHARED) -o $(LIBDIR)/libmatrix.so

part2:
	mkdir -p $(LIBDIR)
	mkdir -p $(BINDIR)
	$(GFORTRAN) $(FDIR)/gemm_test.f90 -o $(BINDIR)/f_only.out
	$(CC) $(CFLAGS) $(CDIR)/matrix.c -o $(LIBDIR)/matrix.o
	$(GFORTRAN) -c $(FDIR)/gemm_test_c.f90 -o $(LIBDIR)/gemm_test_c.o
	$(GFORTRAN) $(LIBDIR)/gemm_test_c.o  $(LIBDIR)/matrix.o -o $(BINDIR)/f_call_c.out

clean:
	rm -rf $(LIBDIR)/* $(BINDIR)/*
	rm *.mod
