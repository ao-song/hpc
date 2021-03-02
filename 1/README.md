# 1 - Assignment II: Programming Languages for HPC

All code located in src/

To build, run:
`cd build && cmake .. && make`

Then you can find:
*part1:* Find the libmatrix.so in lib/
*part2:* Find gemm_test.out in bin/
*part3:* Copy the generated *matrix.cpython-38-x86_64-linux-gnu.so* with *run_matrix.py* and run `pipenv run python3 run_matrix.py`, then you will find two results, one was calculated by calling the cpp code, another was calculated via operator * provided by numpy library.

**Notice** you have to install pipenv to create virtual environment to run the python code.
