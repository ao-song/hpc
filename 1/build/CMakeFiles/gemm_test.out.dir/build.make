# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ao/kth/HPC/assignments/hpc/1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ao/kth/HPC/assignments/hpc/1/build

# Include any dependencies generated for this target.
include CMakeFiles/gemm_test.out.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/gemm_test.out.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gemm_test.out.dir/flags.make

CMakeFiles/gemm_test.out.dir/src/gemm_test.f90.o: CMakeFiles/gemm_test.out.dir/flags.make
CMakeFiles/gemm_test.out.dir/src/gemm_test.f90.o: ../src/gemm_test.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ao/kth/HPC/assignments/hpc/1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building Fortran object CMakeFiles/gemm_test.out.dir/src/gemm_test.f90.o"
	gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/ao/kth/HPC/assignments/hpc/1/src/gemm_test.f90 -o CMakeFiles/gemm_test.out.dir/src/gemm_test.f90.o

CMakeFiles/gemm_test.out.dir/src/gemm_test.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/gemm_test.out.dir/src/gemm_test.f90.i"
	gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/ao/kth/HPC/assignments/hpc/1/src/gemm_test.f90 > CMakeFiles/gemm_test.out.dir/src/gemm_test.f90.i

CMakeFiles/gemm_test.out.dir/src/gemm_test.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/gemm_test.out.dir/src/gemm_test.f90.s"
	gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/ao/kth/HPC/assignments/hpc/1/src/gemm_test.f90 -o CMakeFiles/gemm_test.out.dir/src/gemm_test.f90.s

CMakeFiles/gemm_test.out.dir/src/gemm_matrix.f90.o: CMakeFiles/gemm_test.out.dir/flags.make
CMakeFiles/gemm_test.out.dir/src/gemm_matrix.f90.o: ../src/gemm_matrix.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ao/kth/HPC/assignments/hpc/1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building Fortran object CMakeFiles/gemm_test.out.dir/src/gemm_matrix.f90.o"
	gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /home/ao/kth/HPC/assignments/hpc/1/src/gemm_matrix.f90 -o CMakeFiles/gemm_test.out.dir/src/gemm_matrix.f90.o

CMakeFiles/gemm_test.out.dir/src/gemm_matrix.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/gemm_test.out.dir/src/gemm_matrix.f90.i"
	gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /home/ao/kth/HPC/assignments/hpc/1/src/gemm_matrix.f90 > CMakeFiles/gemm_test.out.dir/src/gemm_matrix.f90.i

CMakeFiles/gemm_test.out.dir/src/gemm_matrix.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/gemm_test.out.dir/src/gemm_matrix.f90.s"
	gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /home/ao/kth/HPC/assignments/hpc/1/src/gemm_matrix.f90 -o CMakeFiles/gemm_test.out.dir/src/gemm_matrix.f90.s

# Object files for target gemm_test.out
gemm_test_out_OBJECTS = \
"CMakeFiles/gemm_test.out.dir/src/gemm_test.f90.o" \
"CMakeFiles/gemm_test.out.dir/src/gemm_matrix.f90.o"

# External object files for target gemm_test.out
gemm_test_out_EXTERNAL_OBJECTS =

../bin/gemm_test.out: CMakeFiles/gemm_test.out.dir/src/gemm_test.f90.o
../bin/gemm_test.out: CMakeFiles/gemm_test.out.dir/src/gemm_matrix.f90.o
../bin/gemm_test.out: CMakeFiles/gemm_test.out.dir/build.make
../bin/gemm_test.out: ../lib/libmatrix.so
../bin/gemm_test.out: CMakeFiles/gemm_test.out.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ao/kth/HPC/assignments/hpc/1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking Fortran executable ../bin/gemm_test.out"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gemm_test.out.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/gemm_test.out.dir/build: ../bin/gemm_test.out

.PHONY : CMakeFiles/gemm_test.out.dir/build

CMakeFiles/gemm_test.out.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gemm_test.out.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gemm_test.out.dir/clean

CMakeFiles/gemm_test.out.dir/depend:
	cd /home/ao/kth/HPC/assignments/hpc/1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ao/kth/HPC/assignments/hpc/1 /home/ao/kth/HPC/assignments/hpc/1 /home/ao/kth/HPC/assignments/hpc/1/build /home/ao/kth/HPC/assignments/hpc/1/build /home/ao/kth/HPC/assignments/hpc/1/build/CMakeFiles/gemm_test.out.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gemm_test.out.dir/depend

