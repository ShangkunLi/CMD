# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lucas/Project/Hi-DPS/CGRA-Modeling

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lucas/Project/Hi-DPS/CGRA-Modeling/build

# Include any dependencies generated for this target.
include src/DFG_Generation/CMakeFiles/genDFGPass.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/DFG_Generation/CMakeFiles/genDFGPass.dir/compiler_depend.make

# Include the progress variables for this target.
include src/DFG_Generation/CMakeFiles/genDFGPass.dir/progress.make

# Include the compile flags for this target's objects.
include src/DFG_Generation/CMakeFiles/genDFGPass.dir/flags.make

src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGNode.cpp.o: src/DFG_Generation/CMakeFiles/genDFGPass.dir/flags.make
src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGNode.cpp.o: ../src/DFG_Generation/DFGNode.cpp
src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGNode.cpp.o: src/DFG_Generation/CMakeFiles/genDFGPass.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lucas/Project/Hi-DPS/CGRA-Modeling/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGNode.cpp.o"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGNode.cpp.o -MF CMakeFiles/genDFGPass.dir/DFGNode.cpp.o.d -o CMakeFiles/genDFGPass.dir/DFGNode.cpp.o -c /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/DFGNode.cpp

src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGNode.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/genDFGPass.dir/DFGNode.cpp.i"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/DFGNode.cpp > CMakeFiles/genDFGPass.dir/DFGNode.cpp.i

src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGNode.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/genDFGPass.dir/DFGNode.cpp.s"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/DFGNode.cpp -o CMakeFiles/genDFGPass.dir/DFGNode.cpp.s

src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGEdge.cpp.o: src/DFG_Generation/CMakeFiles/genDFGPass.dir/flags.make
src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGEdge.cpp.o: ../src/DFG_Generation/DFGEdge.cpp
src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGEdge.cpp.o: src/DFG_Generation/CMakeFiles/genDFGPass.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lucas/Project/Hi-DPS/CGRA-Modeling/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGEdge.cpp.o"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGEdge.cpp.o -MF CMakeFiles/genDFGPass.dir/DFGEdge.cpp.o.d -o CMakeFiles/genDFGPass.dir/DFGEdge.cpp.o -c /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/DFGEdge.cpp

src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGEdge.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/genDFGPass.dir/DFGEdge.cpp.i"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/DFGEdge.cpp > CMakeFiles/genDFGPass.dir/DFGEdge.cpp.i

src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGEdge.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/genDFGPass.dir/DFGEdge.cpp.s"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/DFGEdge.cpp -o CMakeFiles/genDFGPass.dir/DFGEdge.cpp.s

src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFG.cpp.o: src/DFG_Generation/CMakeFiles/genDFGPass.dir/flags.make
src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFG.cpp.o: ../src/DFG_Generation/DFG.cpp
src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFG.cpp.o: src/DFG_Generation/CMakeFiles/genDFGPass.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lucas/Project/Hi-DPS/CGRA-Modeling/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFG.cpp.o"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFG.cpp.o -MF CMakeFiles/genDFGPass.dir/DFG.cpp.o.d -o CMakeFiles/genDFGPass.dir/DFG.cpp.o -c /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/DFG.cpp

src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFG.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/genDFGPass.dir/DFG.cpp.i"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/DFG.cpp > CMakeFiles/genDFGPass.dir/DFG.cpp.i

src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFG.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/genDFGPass.dir/DFG.cpp.s"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/DFG.cpp -o CMakeFiles/genDFGPass.dir/DFG.cpp.s

src/DFG_Generation/CMakeFiles/genDFGPass.dir/DataMemNode.cpp.o: src/DFG_Generation/CMakeFiles/genDFGPass.dir/flags.make
src/DFG_Generation/CMakeFiles/genDFGPass.dir/DataMemNode.cpp.o: ../src/DFG_Generation/DataMemNode.cpp
src/DFG_Generation/CMakeFiles/genDFGPass.dir/DataMemNode.cpp.o: src/DFG_Generation/CMakeFiles/genDFGPass.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lucas/Project/Hi-DPS/CGRA-Modeling/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/DFG_Generation/CMakeFiles/genDFGPass.dir/DataMemNode.cpp.o"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/DFG_Generation/CMakeFiles/genDFGPass.dir/DataMemNode.cpp.o -MF CMakeFiles/genDFGPass.dir/DataMemNode.cpp.o.d -o CMakeFiles/genDFGPass.dir/DataMemNode.cpp.o -c /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/DataMemNode.cpp

src/DFG_Generation/CMakeFiles/genDFGPass.dir/DataMemNode.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/genDFGPass.dir/DataMemNode.cpp.i"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/DataMemNode.cpp > CMakeFiles/genDFGPass.dir/DataMemNode.cpp.i

src/DFG_Generation/CMakeFiles/genDFGPass.dir/DataMemNode.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/genDFGPass.dir/DataMemNode.cpp.s"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/DataMemNode.cpp -o CMakeFiles/genDFGPass.dir/DataMemNode.cpp.s

src/DFG_Generation/CMakeFiles/genDFGPass.dir/genDFGPass.cpp.o: src/DFG_Generation/CMakeFiles/genDFGPass.dir/flags.make
src/DFG_Generation/CMakeFiles/genDFGPass.dir/genDFGPass.cpp.o: ../src/DFG_Generation/genDFGPass.cpp
src/DFG_Generation/CMakeFiles/genDFGPass.dir/genDFGPass.cpp.o: src/DFG_Generation/CMakeFiles/genDFGPass.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lucas/Project/Hi-DPS/CGRA-Modeling/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/DFG_Generation/CMakeFiles/genDFGPass.dir/genDFGPass.cpp.o"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/DFG_Generation/CMakeFiles/genDFGPass.dir/genDFGPass.cpp.o -MF CMakeFiles/genDFGPass.dir/genDFGPass.cpp.o.d -o CMakeFiles/genDFGPass.dir/genDFGPass.cpp.o -c /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/genDFGPass.cpp

src/DFG_Generation/CMakeFiles/genDFGPass.dir/genDFGPass.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/genDFGPass.dir/genDFGPass.cpp.i"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/genDFGPass.cpp > CMakeFiles/genDFGPass.dir/genDFGPass.cpp.i

src/DFG_Generation/CMakeFiles/genDFGPass.dir/genDFGPass.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/genDFGPass.dir/genDFGPass.cpp.s"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation/genDFGPass.cpp -o CMakeFiles/genDFGPass.dir/genDFGPass.cpp.s

# Object files for target genDFGPass
genDFGPass_OBJECTS = \
"CMakeFiles/genDFGPass.dir/DFGNode.cpp.o" \
"CMakeFiles/genDFGPass.dir/DFGEdge.cpp.o" \
"CMakeFiles/genDFGPass.dir/DFG.cpp.o" \
"CMakeFiles/genDFGPass.dir/DataMemNode.cpp.o" \
"CMakeFiles/genDFGPass.dir/genDFGPass.cpp.o"

# External object files for target genDFGPass
genDFGPass_EXTERNAL_OBJECTS =

src/DFG_Generation/libgenDFGPass.so: src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGNode.cpp.o
src/DFG_Generation/libgenDFGPass.so: src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFGEdge.cpp.o
src/DFG_Generation/libgenDFGPass.so: src/DFG_Generation/CMakeFiles/genDFGPass.dir/DFG.cpp.o
src/DFG_Generation/libgenDFGPass.so: src/DFG_Generation/CMakeFiles/genDFGPass.dir/DataMemNode.cpp.o
src/DFG_Generation/libgenDFGPass.so: src/DFG_Generation/CMakeFiles/genDFGPass.dir/genDFGPass.cpp.o
src/DFG_Generation/libgenDFGPass.so: src/DFG_Generation/CMakeFiles/genDFGPass.dir/build.make
src/DFG_Generation/libgenDFGPass.so: src/DFG_Generation/CMakeFiles/genDFGPass.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lucas/Project/Hi-DPS/CGRA-Modeling/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX shared module libgenDFGPass.so"
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/genDFGPass.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/DFG_Generation/CMakeFiles/genDFGPass.dir/build: src/DFG_Generation/libgenDFGPass.so
.PHONY : src/DFG_Generation/CMakeFiles/genDFGPass.dir/build

src/DFG_Generation/CMakeFiles/genDFGPass.dir/clean:
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation && $(CMAKE_COMMAND) -P CMakeFiles/genDFGPass.dir/cmake_clean.cmake
.PHONY : src/DFG_Generation/CMakeFiles/genDFGPass.dir/clean

src/DFG_Generation/CMakeFiles/genDFGPass.dir/depend:
	cd /home/lucas/Project/Hi-DPS/CGRA-Modeling/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lucas/Project/Hi-DPS/CGRA-Modeling /home/lucas/Project/Hi-DPS/CGRA-Modeling/src/DFG_Generation /home/lucas/Project/Hi-DPS/CGRA-Modeling/build /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation /home/lucas/Project/Hi-DPS/CGRA-Modeling/build/src/DFG_Generation/CMakeFiles/genDFGPass.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/DFG_Generation/CMakeFiles/genDFGPass.dir/depend

