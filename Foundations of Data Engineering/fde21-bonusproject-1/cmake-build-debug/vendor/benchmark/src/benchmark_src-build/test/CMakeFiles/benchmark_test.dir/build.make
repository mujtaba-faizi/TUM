# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/clion/169/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/169/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build

# Include any dependencies generated for this target.
include test/CMakeFiles/benchmark_test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/benchmark_test.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/benchmark_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/benchmark_test.dir/flags.make

test/CMakeFiles/benchmark_test.dir/benchmark_test.cc.o: test/CMakeFiles/benchmark_test.dir/flags.make
test/CMakeFiles/benchmark_test.dir/benchmark_test.cc.o: /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src/test/benchmark_test.cc
test/CMakeFiles/benchmark_test.dir/benchmark_test.cc.o: test/CMakeFiles/benchmark_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/benchmark_test.dir/benchmark_test.cc.o"
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/CMakeFiles/benchmark_test.dir/benchmark_test.cc.o -MF CMakeFiles/benchmark_test.dir/benchmark_test.cc.o.d -o CMakeFiles/benchmark_test.dir/benchmark_test.cc.o -c /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src/test/benchmark_test.cc

test/CMakeFiles/benchmark_test.dir/benchmark_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/benchmark_test.dir/benchmark_test.cc.i"
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src/test/benchmark_test.cc > CMakeFiles/benchmark_test.dir/benchmark_test.cc.i

test/CMakeFiles/benchmark_test.dir/benchmark_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/benchmark_test.dir/benchmark_test.cc.s"
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src/test/benchmark_test.cc -o CMakeFiles/benchmark_test.dir/benchmark_test.cc.s

# Object files for target benchmark_test
benchmark_test_OBJECTS = \
"CMakeFiles/benchmark_test.dir/benchmark_test.cc.o"

# External object files for target benchmark_test
benchmark_test_EXTERNAL_OBJECTS =

test/benchmark_test: test/CMakeFiles/benchmark_test.dir/benchmark_test.cc.o
test/benchmark_test: test/CMakeFiles/benchmark_test.dir/build.make
test/benchmark_test: src/libbenchmark.a
test/benchmark_test: /usr/lib/x86_64-linux-gnu/librt.so
test/benchmark_test: test/CMakeFiles/benchmark_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable benchmark_test"
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/benchmark_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/benchmark_test.dir/build: test/benchmark_test
.PHONY : test/CMakeFiles/benchmark_test.dir/build

test/CMakeFiles/benchmark_test.dir/clean:
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test && $(CMAKE_COMMAND) -P CMakeFiles/benchmark_test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/benchmark_test.dir/clean

test/CMakeFiles/benchmark_test.dir/depend:
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src/test /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test/CMakeFiles/benchmark_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/benchmark_test.dir/depend

