# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.21

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
CMAKE_COMMAND = /snap/clion/180/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/180/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mujtaba/Downloads/fde21-bonusproject-1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug

# Utility rule file for gtest_src.

# Include any custom commands dependencies for this target.
include CMakeFiles/gtest_src.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/gtest_src.dir/progress.make

CMakeFiles/gtest_src: CMakeFiles/gtest_src-complete

CMakeFiles/gtest_src-complete: vendor/gtm/src/gtest_src-stamp/gtest_src-install
CMakeFiles/gtest_src-complete: vendor/gtm/src/gtest_src-stamp/gtest_src-mkdir
CMakeFiles/gtest_src-complete: vendor/gtm/src/gtest_src-stamp/gtest_src-download
CMakeFiles/gtest_src-complete: vendor/gtm/src/gtest_src-stamp/gtest_src-update
CMakeFiles/gtest_src-complete: vendor/gtm/src/gtest_src-stamp/gtest_src-patch
CMakeFiles/gtest_src-complete: vendor/gtm/src/gtest_src-stamp/gtest_src-configure
CMakeFiles/gtest_src-complete: vendor/gtm/src/gtest_src-stamp/gtest_src-build
CMakeFiles/gtest_src-complete: vendor/gtm/src/gtest_src-stamp/gtest_src-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'gtest_src'"
	/snap/clion/180/bin/cmake/linux/bin/cmake -E make_directory /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/CMakeFiles
	/snap/clion/180/bin/cmake/linux/bin/cmake -E touch /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/CMakeFiles/gtest_src-complete
	/snap/clion/180/bin/cmake/linux/bin/cmake -E touch /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-stamp/gtest_src-done

vendor/gtm/src/gtest_src-stamp/gtest_src-build: vendor/gtm/src/gtest_src-stamp/gtest_src-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing build step for 'gtest_src'"
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-build && $(MAKE)
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-build && /snap/clion/180/bin/cmake/linux/bin/cmake -E touch /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-stamp/gtest_src-build

vendor/gtm/src/gtest_src-stamp/gtest_src-configure: vendor/gtm/tmp/gtest_src-cfgcmd.txt
vendor/gtm/src/gtest_src-stamp/gtest_src-configure: vendor/gtm/src/gtest_src-stamp/gtest_src-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Performing configure step for 'gtest_src'"
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-build && /snap/clion/180/bin/cmake/linux/bin/cmake -DCMAKE_INSTALL_PREFIX=/home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/gtest -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ -DCMAKE_CXX_FLAGS= "-GCodeBlocks - Unix Makefiles" /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/googletest/googletest
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-build && /snap/clion/180/bin/cmake/linux/bin/cmake -E touch /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-stamp/gtest_src-configure

vendor/gtm/src/gtest_src-stamp/gtest_src-download: vendor/gtm/src/gtest_src-stamp/gtest_src-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "No download step for 'gtest_src'"
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src && /snap/clion/180/bin/cmake/linux/bin/cmake -E echo_append
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src && /snap/clion/180/bin/cmake/linux/bin/cmake -E touch /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-stamp/gtest_src-download

vendor/gtm/src/gtest_src-stamp/gtest_src-install: vendor/gtm/src/gtest_src-stamp/gtest_src-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Performing install step for 'gtest_src'"
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-build && $(MAKE) install
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-build && /snap/clion/180/bin/cmake/linux/bin/cmake -E touch /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-stamp/gtest_src-install

vendor/gtm/src/gtest_src-stamp/gtest_src-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'gtest_src'"
	/snap/clion/180/bin/cmake/linux/bin/cmake -E make_directory /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/googletest/googletest
	/snap/clion/180/bin/cmake/linux/bin/cmake -E make_directory /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-build
	/snap/clion/180/bin/cmake/linux/bin/cmake -E make_directory /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/gtest
	/snap/clion/180/bin/cmake/linux/bin/cmake -E make_directory /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/tmp
	/snap/clion/180/bin/cmake/linux/bin/cmake -E make_directory /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-stamp
	/snap/clion/180/bin/cmake/linux/bin/cmake -E make_directory /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src
	/snap/clion/180/bin/cmake/linux/bin/cmake -E make_directory /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-stamp
	/snap/clion/180/bin/cmake/linux/bin/cmake -E touch /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-stamp/gtest_src-mkdir

vendor/gtm/src/gtest_src-stamp/gtest_src-patch: vendor/gtm/src/gtest_src-stamp/gtest_src-update
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'gtest_src'"
	/snap/clion/180/bin/cmake/linux/bin/cmake -E echo_append
	/snap/clion/180/bin/cmake/linux/bin/cmake -E touch /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-stamp/gtest_src-patch

vendor/gtm/src/gtest_src-stamp/gtest_src-update: vendor/gtm/src/gtest_src-stamp/gtest_src-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "No update step for 'gtest_src'"
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/googletest/googletest && /snap/clion/180/bin/cmake/linux/bin/cmake -E echo_append
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/googletest/googletest && /snap/clion/180/bin/cmake/linux/bin/cmake -E touch /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/vendor/gtm/src/gtest_src-stamp/gtest_src-update

gtest_src: CMakeFiles/gtest_src
gtest_src: CMakeFiles/gtest_src-complete
gtest_src: vendor/gtm/src/gtest_src-stamp/gtest_src-build
gtest_src: vendor/gtm/src/gtest_src-stamp/gtest_src-configure
gtest_src: vendor/gtm/src/gtest_src-stamp/gtest_src-download
gtest_src: vendor/gtm/src/gtest_src-stamp/gtest_src-install
gtest_src: vendor/gtm/src/gtest_src-stamp/gtest_src-mkdir
gtest_src: vendor/gtm/src/gtest_src-stamp/gtest_src-patch
gtest_src: vendor/gtm/src/gtest_src-stamp/gtest_src-update
gtest_src: CMakeFiles/gtest_src.dir/build.make
.PHONY : gtest_src

# Rule to build all files generated by this target.
CMakeFiles/gtest_src.dir/build: gtest_src
.PHONY : CMakeFiles/gtest_src.dir/build

CMakeFiles/gtest_src.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gtest_src.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gtest_src.dir/clean

CMakeFiles/gtest_src.dir/depend:
	cd /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mujtaba/Downloads/fde21-bonusproject-1 /home/mujtaba/Downloads/fde21-bonusproject-1 /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug /home/mujtaba/Downloads/fde21-bonusproject-1/cmake-build-debug/CMakeFiles/gtest_src.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gtest_src.dir/depend

