# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

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
CMAKE_COMMAND = /home/jossian/.local/lib/python3.10/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /home/jossian/.local/lib/python3.10/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jossian/repository/tukey/seiffarth/Approximation

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jossian/repository/tukey/seiffarth/Approximation/build

# Include any dependencies generated for this target.
include CMakeFiles/ApproximateTukeyDepth.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/ApproximateTukeyDepth.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ApproximateTukeyDepth.dir/flags.make

CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/src/approximate_tukey.cpp
CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/src/approximate_tukey.cpp

CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/src/approximate_tukey.cpp > CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/src/approximate_tukey.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.o: /home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp
CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.o -c /home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp

CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp > CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/Data/GraphData.cpp
CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/Data/GraphData.cpp

CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/Data/GraphData.cpp > CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/Data/GraphData.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/Data/OuterplanarGraphData.cpp
CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/Data/OuterplanarGraphData.cpp

CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/Data/OuterplanarGraphData.cpp > CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/Data/OuterplanarGraphData.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/Utils/StaticFunctions.cpp
CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/Utils/StaticFunctions.cpp

CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/Utils/StaticFunctions.cpp > CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/Utils/StaticFunctions.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/Utils/GraphFunctions.cpp
CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/Utils/GraphFunctions.cpp

CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/Utils/GraphFunctions.cpp > CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/Utils/GraphFunctions.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/Utils/OuterplanarSubgraph.cpp
CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/Utils/OuterplanarSubgraph.cpp

CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/Utils/OuterplanarSubgraph.cpp > CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/Utils/OuterplanarSubgraph.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/Utils/OuterplanarSubgraphDFS.cpp
CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/Utils/OuterplanarSubgraphDFS.cpp

CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/Utils/OuterplanarSubgraphDFS.cpp > CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/Utils/OuterplanarSubgraphDFS.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/Utils/graphio.cpp
CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/Utils/graphio.cpp

CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/Utils/graphio.cpp > CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/Utils/graphio.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/Utils/Graphs.cpp
CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/Utils/Graphs.cpp

CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/Utils/Graphs.cpp > CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/Utils/Graphs.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/Utils/LoadTUDortmundGraphData.cpp
CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/Utils/LoadTUDortmundGraphData.cpp

CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/Utils/LoadTUDortmundGraphData.cpp > CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/Utils/LoadTUDortmundGraphData.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/ClosureOperators/BaseOperator.cpp
CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/ClosureOperators/BaseOperator.cpp

CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/ClosureOperators/BaseOperator.cpp > CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/ClosureOperators/BaseOperator.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/ClosureOperators/GraphClosures.cpp
CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/ClosureOperators/GraphClosures.cpp

CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/ClosureOperators/GraphClosures.cpp > CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/ClosureOperators/GraphClosures.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/InitUpdate/InitUpdateBase.cpp
CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/InitUpdate/InitUpdateBase.cpp

CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/InitUpdate/InitUpdateBase.cpp > CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/InitUpdate/InitUpdateBase.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.s

CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/flags.make
CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.o: /home/jossian/repository/tukey/seiffarth/Approximation/InitUpdate/GraphInitUpdate.cpp
CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.o: CMakeFiles/ApproximateTukeyDepth.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.o -MF CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.o.d -o CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.o -c /home/jossian/repository/tukey/seiffarth/Approximation/InitUpdate/GraphInitUpdate.cpp

CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey/seiffarth/Approximation/InitUpdate/GraphInitUpdate.cpp > CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.i

CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey/seiffarth/Approximation/InitUpdate/GraphInitUpdate.cpp -o CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.s

# Object files for target ApproximateTukeyDepth
ApproximateTukeyDepth_OBJECTS = \
"CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.o" \
"CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.o"

# External object files for target ApproximateTukeyDepth
ApproximateTukeyDepth_EXTERNAL_OBJECTS =

ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/src/approximate_tukey.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/home/jossian/repository/tukey/seiffarth/libs/Snap-6.0/snap-core/Snap.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/Data/GraphData.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/Data/OuterplanarGraphData.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/Utils/StaticFunctions.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/Utils/GraphFunctions.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraph.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/Utils/OuterplanarSubgraphDFS.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/Utils/graphio.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/Utils/Graphs.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/Utils/LoadTUDortmundGraphData.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/BaseOperator.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/ClosureOperators/GraphClosures.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/InitUpdateBase.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/InitUpdate/GraphInitUpdate.cpp.o
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/build.make
ApproximateTukeyDepth: /home/jossian/repository/tukey/seiffarth/Approximation/../libs/libIO/include/FileEvaluation.cpp
ApproximateTukeyDepth: /home/jossian/repository/tukey/seiffarth/Approximation/../libs/libIO/include/FileEvaluation.h
ApproximateTukeyDepth: /home/jossian/repository/tukey/seiffarth/Approximation/../libs/libIO/include/StaticFunctions.cpp
ApproximateTukeyDepth: /home/jossian/repository/tukey/seiffarth/Approximation/../libs/libIO/include/StaticFunctions.h
ApproximateTukeyDepth: /home/jossian/repository/tukey/seiffarth/Approximation/../libs/libIO/include/io.h
ApproximateTukeyDepth: CMakeFiles/ApproximateTukeyDepth.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Linking CXX executable ApproximateTukeyDepth"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ApproximateTukeyDepth.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ApproximateTukeyDepth.dir/build: ApproximateTukeyDepth
.PHONY : CMakeFiles/ApproximateTukeyDepth.dir/build

CMakeFiles/ApproximateTukeyDepth.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ApproximateTukeyDepth.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ApproximateTukeyDepth.dir/clean

CMakeFiles/ApproximateTukeyDepth.dir/depend:
	cd /home/jossian/repository/tukey/seiffarth/Approximation/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jossian/repository/tukey/seiffarth/Approximation /home/jossian/repository/tukey/seiffarth/Approximation /home/jossian/repository/tukey/seiffarth/Approximation/build /home/jossian/repository/tukey/seiffarth/Approximation/build /home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles/ApproximateTukeyDepth.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ApproximateTukeyDepth.dir/depend

