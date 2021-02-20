# 1 - Assignment II: Programming Languages for HPC

c code in *c_src*, fortran code in *f_src*, python code in *py_src*

## Part 1
To build part1, run `make part1` then find *libmatrix.so* under *lib*.

## Part 2
To build part2, run `make part2` then the excutable binaries will be located in *bin*.

To run fortran implemented matrix multiplication, run `bin/gemm_test_f_only.out`
To run call c from fortran, run `bin/gemm_test_f_call_c.out`

## Part 3
pipenv is needed, please install first.

To run and check the result, just run `make part3`, the result of matrix multiplication of both via pybind11 and numpy matmul will be displayed.
