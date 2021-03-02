cmake_minimum_required(VERSION 3.9)

project(HPC-Assignment-II VERSION 0.0.1
        LANGUAGES Fortran C CXX)

set(CMAKE_Fortran_COMPILER gfortran)

include_directories("${CMAKE_SOURCE_DIR}/src/")

add_library(matrix SHARED src/matrix.c)

add_executable(gemm_test.out src/gemm_test.f90)

add_subdirectory(pybind11)
pybind11_add_module(py_matrix "${CMAKE_SOURCE_DIR}/src/matrix.cc")

set_target_properties(py_matrix PROPERTIES OUTPUT_NAME matrix)

target_link_libraries(py_matrix PUBLIC matrix)
target_link_libraries(gemm_test.out PRIVATE matrix)

target_compile_options(matrix PRIVATE -Wall -O3)

set_target_properties(
    matrix gemm_test.out py_matrix
    PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib/"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/")
