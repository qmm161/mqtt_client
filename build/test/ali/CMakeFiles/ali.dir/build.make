# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /home/easyboard/lon_tools/mqtt1110/mqttclient-master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build

# Include any dependencies generated for this target.
include test/ali/CMakeFiles/ali.dir/depend.make

# Include the progress variables for this target.
include test/ali/CMakeFiles/ali.dir/progress.make

# Include the compile flags for this target's objects.
include test/ali/CMakeFiles/ali.dir/flags.make

test/ali/CMakeFiles/ali.dir/test.c.o: test/ali/CMakeFiles/ali.dir/flags.make
test/ali/CMakeFiles/ali.dir/test.c.o: ../test/ali/test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object test/ali/CMakeFiles/ali.dir/test.c.o"
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/test/ali && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ali.dir/test.c.o   -c /home/easyboard/lon_tools/mqtt1110/mqttclient-master/test/ali/test.c

test/ali/CMakeFiles/ali.dir/test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ali.dir/test.c.i"
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/test/ali && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/easyboard/lon_tools/mqtt1110/mqttclient-master/test/ali/test.c > CMakeFiles/ali.dir/test.c.i

test/ali/CMakeFiles/ali.dir/test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ali.dir/test.c.s"
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/test/ali && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/easyboard/lon_tools/mqtt1110/mqttclient-master/test/ali/test.c -o CMakeFiles/ali.dir/test.c.s

test/ali/CMakeFiles/ali.dir/test.c.o.requires:

.PHONY : test/ali/CMakeFiles/ali.dir/test.c.o.requires

test/ali/CMakeFiles/ali.dir/test.c.o.provides: test/ali/CMakeFiles/ali.dir/test.c.o.requires
	$(MAKE) -f test/ali/CMakeFiles/ali.dir/build.make test/ali/CMakeFiles/ali.dir/test.c.o.provides.build
.PHONY : test/ali/CMakeFiles/ali.dir/test.c.o.provides

test/ali/CMakeFiles/ali.dir/test.c.o.provides.build: test/ali/CMakeFiles/ali.dir/test.c.o


# Object files for target ali
ali_OBJECTS = \
"CMakeFiles/ali.dir/test.c.o"

# External object files for target ali
ali_EXTERNAL_OBJECTS =

bin/ali: test/ali/CMakeFiles/ali.dir/test.c.o
bin/ali: test/ali/CMakeFiles/ali.dir/build.make
bin/ali: lib/libmqtt.a
bin/ali: lib/libplatform.a
bin/ali: lib/libnetwork.a
bin/ali: lib/libcommon.a
bin/ali: lib/libsalof.a
bin/ali: lib/libmbedtls.a
bin/ali: lib/libmqttclient.a
bin/ali: lib/libarch.a
bin/ali: lib/libmqtt.a
bin/ali: lib/libnetwork.a
bin/ali: lib/libmbedtls.a
bin/ali: lib/libwrapper.a
bin/ali: lib/libplatform.a
bin/ali: lib/libcommon.a
bin/ali: test/ali/CMakeFiles/ali.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/ali"
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/test/ali && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ali.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/ali/CMakeFiles/ali.dir/build: bin/ali

.PHONY : test/ali/CMakeFiles/ali.dir/build

test/ali/CMakeFiles/ali.dir/requires: test/ali/CMakeFiles/ali.dir/test.c.o.requires

.PHONY : test/ali/CMakeFiles/ali.dir/requires

test/ali/CMakeFiles/ali.dir/clean:
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/test/ali && $(CMAKE_COMMAND) -P CMakeFiles/ali.dir/cmake_clean.cmake
.PHONY : test/ali/CMakeFiles/ali.dir/clean

test/ali/CMakeFiles/ali.dir/depend:
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/easyboard/lon_tools/mqtt1110/mqttclient-master /home/easyboard/lon_tools/mqtt1110/mqttclient-master/test/ali /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/test/ali /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/test/ali/CMakeFiles/ali.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/ali/CMakeFiles/ali.dir/depend

