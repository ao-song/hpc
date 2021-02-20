.PHONY: build clean

CC = gcc
CPP = g++
CFLAGS = -c -fPIC
CPPFLAGS = -O3 -Wall -shared -std=c++11 -fPIC
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
	$(GFORTRAN) $(FDIR)/gemm_test.f90 -o $(BINDIR)/gemm_test_f_only.out
	$(CC) $(CFLAGS) $(CDIR)/matrix.c -o $(LIBDIR)/matrix.o
	$(GFORTRAN) -c $(FDIR)/gemm_test_c.f90 -o $(LIBDIR)/gemm_test_c.o
	$(GFORTRAN) $(LIBDIR)/gemm_test_c.o  $(LIBDIR)/matrix.o -o $(BINDIR)/gemm_test_f_call_c.out

part3:
	cd $(PYDIR) && pipenv install
	cd $(PYDIR) && $(CPP) $(CPPFLAGS) `pipenv run python3 -m pybind11 --includes` mul_matrix.cc -o mul_matrix`python3-config --extension-suffix`
	cd $(PYDIR) && pipenv run python3 run_matrix.py

clean:
	rm -rf $(LIBDIR)/* $(BINDIR)/*
	rm *.mod
	rm $(PYDIR)/*.so
