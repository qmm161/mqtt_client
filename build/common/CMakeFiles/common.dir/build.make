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
include common/CMakeFiles/common.dir/depend.make

# Include the progress variables for this target.
include common/CMakeFiles/common.dir/progress.make

# Include the compile flags for this target's objects.
include common/CMakeFiles/common.dir/flags.make

common/CMakeFiles/common.dir/mqtt_list.c.o: common/CMakeFiles/common.dir/flags.make
common/CMakeFiles/common.dir/mqtt_list.c.o: ../common/mqtt_list.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object common/CMakeFiles/common.dir/mqtt_list.c.o"
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/common && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/common.dir/mqtt_list.c.o   -c /home/easyboard/lon_tools/mqtt1110/mqttclient-master/common/mqtt_list.c

common/CMakeFiles/common.dir/mqtt_list.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/common.dir/mqtt_list.c.i"
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/common && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/easyboard/lon_tools/mqtt1110/mqttclient-master/common/mqtt_list.c > CMakeFiles/common.dir/mqtt_list.c.i

common/CMakeFiles/common.dir/mqtt_list.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/common.dir/mqtt_list.c.s"
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/common && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/easyboard/lon_tools/mqtt1110/mqttclient-master/common/mqtt_list.c -o CMakeFiles/common.dir/mqtt_list.c.s

common/CMakeFiles/common.dir/mqtt_list.c.o.requires:

.PHONY : common/CMakeFiles/common.dir/mqtt_list.c.o.requires

common/CMakeFiles/common.dir/mqtt_list.c.o.provides: common/CMakeFiles/common.dir/mqtt_list.c.o.requires
	$(MAKE) -f common/CMakeFiles/common.dir/build.make common/CMakeFiles/common.dir/mqtt_list.c.o.provides.build
.PHONY : common/CMakeFiles/common.dir/mqtt_list.c.o.provides

common/CMakeFiles/common.dir/mqtt_list.c.o.provides.build: common/CMakeFiles/common.dir/mqtt_list.c.o


common/CMakeFiles/common.dir/random.c.o: common/CMakeFiles/common.dir/flags.make
common/CMakeFiles/common.dir/random.c.o: ../common/random.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object common/CMakeFiles/common.dir/random.c.o"
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/common && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/common.dir/random.c.o   -c /home/easyboard/lon_tools/mqtt1110/mqttclient-master/common/random.c

common/CMakeFiles/common.dir/random.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/common.dir/random.c.i"
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/common && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/easyboard/lon_tools/mqtt1110/mqttclient-master/common/random.c > CMakeFiles/common.dir/random.c.i

common/CMakeFiles/common.dir/random.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/common.dir/random.c.s"
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/common && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/easyboard/lon_tools/mqtt1110/mqttclient-master/common/random.c -o CMakeFiles/common.dir/random.c.s

common/CMakeFiles/common.dir/random.c.o.requires:

.PHONY : common/CMakeFiles/common.dir/random.c.o.requires

common/CMakeFiles/common.dir/random.c.o.provides: common/CMakeFiles/common.dir/random.c.o.requires
	$(MAKE) -f common/CMakeFiles/common.dir/build.make common/CMakeFiles/common.dir/random.c.o.provides.build
.PHONY : common/CMakeFiles/common.dir/random.c.o.provides

common/CMakeFiles/common.dir/random.c.o.provides.build: common/CMakeFiles/common.dir/random.c.o


# Object files for target common
common_OBJECTS = \
"CMakeFiles/common.dir/mqtt_list.c.o" \
"CMakeFiles/common.dir/random.c.o"

# External object files for target common
common_EXTERNAL_OBJECTS =

lib/libcommon.a: common/CMakeFiles/common.dir/mqtt_list.c.o
lib/libcommon.a: common/CMakeFiles/common.dir/random.c.o
lib/libcommon.a: common/CMakeFiles/common.dir/build.make
lib/libcommon.a: common/CMakeFiles/common.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C static library ../lib/libcommon.a"
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/common && $(CMAKE_COMMAND) -P CMakeFiles/common.dir/cmake_clean_target.cmake
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/common && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/common.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
common/CMakeFiles/common.dir/build: lib/libcommon.a

.PHONY : common/CMakeFiles/common.dir/build

common/CMakeFiles/common.dir/requires: common/CMakeFiles/common.dir/mqtt_list.c.o.requires
common/CMakeFiles/common.dir/requires: common/CMakeFiles/common.dir/random.c.o.requires

.PHONY : common/CMakeFiles/common.dir/requires

common/CMakeFiles/common.dir/clean:
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/common && $(CMAKE_COMMAND) -P CMakeFiles/common.dir/cmake_clean.cmake
.PHONY : common/CMakeFiles/common.dir/clean

common/CMakeFiles/common.dir/depend:
	cd /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/easyboard/lon_tools/mqtt1110/mqttclient-master /home/easyboard/lon_tools/mqtt1110/mqttclient-master/common /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/common /home/easyboard/lon_tools/mqtt1110/mqttclient-master/build/common/CMakeFiles/common.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : common/CMakeFiles/common.dir/depend

