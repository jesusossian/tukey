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
CMAKE_SOURCE_DIR = /home/jossian/repository/tukey_depth/TukeyDepth

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jossian/repository/tukey_depth/TukeyDepth/build

# Include any dependencies generated for this target.
include CMakeFiles/TukeyComputation.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/TukeyComputation.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/TukeyComputation.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TukeyComputation.dir/flags.make

CMakeFiles/TukeyComputation.dir/tukey.cpp.o: CMakeFiles/TukeyComputation.dir/flags.make
CMakeFiles/TukeyComputation.dir/tukey.cpp.o: ../tukey.cpp
CMakeFiles/TukeyComputation.dir/tukey.cpp.o: CMakeFiles/TukeyComputation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey_depth/TukeyDepth/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/TukeyComputation.dir/tukey.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TukeyComputation.dir/tukey.cpp.o -MF CMakeFiles/TukeyComputation.dir/tukey.cpp.o.d -o CMakeFiles/TukeyComputation.dir/tukey.cpp.o -c /home/jossian/repository/tukey_depth/TukeyDepth/tukey.cpp

CMakeFiles/TukeyComputation.dir/tukey.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TukeyComputation.dir/tukey.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey_depth/TukeyDepth/tukey.cpp > CMakeFiles/TukeyComputation.dir/tukey.cpp.i

CMakeFiles/TukeyComputation.dir/tukey.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TukeyComputation.dir/tukey.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey_depth/TukeyDepth/tukey.cpp -o CMakeFiles/TukeyComputation.dir/tukey.cpp.s

CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.o: CMakeFiles/TukeyComputation.dir/flags.make
CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.o: ../Algorithm/TukeyDepth.cpp
CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.o: CMakeFiles/TukeyComputation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey_depth/TukeyDepth/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.o -MF CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.o.d -o CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.o -c /home/jossian/repository/tukey_depth/TukeyDepth/Algorithm/TukeyDepth.cpp

CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey_depth/TukeyDepth/Algorithm/TukeyDepth.cpp > CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.i

CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey_depth/TukeyDepth/Algorithm/TukeyDepth.cpp -o CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.s

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.o: CMakeFiles/TukeyComputation.dir/flags.make
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.o: /home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.o: CMakeFiles/TukeyComputation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey_depth/TukeyDepth/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.o -MF CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.o.d -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.o -c /home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp > CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.i

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.s

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.o: CMakeFiles/TukeyComputation.dir/flags.make
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.o: /home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.o: CMakeFiles/TukeyComputation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey_depth/TukeyDepth/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.o -MF CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.o.d -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.o -c /home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp > CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.i

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.s

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.o: CMakeFiles/TukeyComputation.dir/flags.make
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.o: /home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.o: CMakeFiles/TukeyComputation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey_depth/TukeyDepth/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.o -MF CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.o.d -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.o -c /home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp > CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.i

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.s

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.o: CMakeFiles/TukeyComputation.dir/flags.make
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.o: /home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.o: CMakeFiles/TukeyComputation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey_depth/TukeyDepth/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.o -MF CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.o.d -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.o -c /home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp > CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.i

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.s

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.o: CMakeFiles/TukeyComputation.dir/flags.make
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.o: /home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.o: CMakeFiles/TukeyComputation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey_depth/TukeyDepth/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.o -MF CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.o.d -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.o -c /home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp > CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.i

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.s

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.o: CMakeFiles/TukeyComputation.dir/flags.make
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.o: /home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.o: CMakeFiles/TukeyComputation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey_depth/TukeyDepth/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.o -MF CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.o.d -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.o -c /home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp > CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.i

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.s

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.o: CMakeFiles/TukeyComputation.dir/flags.make
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.o: /home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp
CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.o: CMakeFiles/TukeyComputation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jossian/repository/tukey_depth/TukeyDepth/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.o -MF CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.o.d -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.o -c /home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp > CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.i

CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp -o CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.s

# Object files for target TukeyComputation
TukeyComputation_OBJECTS = \
"CMakeFiles/TukeyComputation.dir/tukey.cpp.o" \
"CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.o" \
"CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.o" \
"CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.o" \
"CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.o" \
"CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.o" \
"CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.o" \
"CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.o" \
"CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.o"

# External object files for target TukeyComputation
TukeyComputation_EXTERNAL_OBJECTS =

TukeyComputation: CMakeFiles/TukeyComputation.dir/tukey.cpp.o
TukeyComputation: CMakeFiles/TukeyComputation.dir/Algorithm/TukeyDepth.cpp.o
TukeyComputation: CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/DataClasses.cpp.o
TukeyComputation: CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/GraphFunctions.cpp.o
TukeyComputation: CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/Load.cpp.o
TukeyComputation: CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/LoadSave.cpp.o
TukeyComputation: CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libGraph/include/SimplePatterns.cpp.o
TukeyComputation: CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/FileEvaluation.cpp.o
TukeyComputation: CMakeFiles/TukeyComputation.dir/home/jossian/repository/tukey_depth/libs/libIO/include/StaticFunctions.cpp.o
TukeyComputation: CMakeFiles/TukeyComputation.dir/build.make
TukeyComputation: /opt/or-tools/lib/libortools.so.9.6.2534
TukeyComputation: /opt/or-tools/lib/libabsl_log_internal_check_op.a
TukeyComputation: /opt/or-tools/lib/libabsl_die_if_null.a
TukeyComputation: /opt/or-tools/lib/libabsl_flags_parse.a
TukeyComputation: /opt/or-tools/lib/libabsl_flags_usage.a
TukeyComputation: /opt/or-tools/lib/libabsl_flags_usage_internal.a
TukeyComputation: /opt/or-tools/lib/libabsl_log_internal_conditions.a
TukeyComputation: /opt/or-tools/lib/libabsl_log_flags.a
TukeyComputation: /opt/or-tools/lib/libabsl_flags.a
TukeyComputation: /opt/or-tools/lib/libabsl_flags_internal.a
TukeyComputation: /opt/or-tools/lib/libabsl_flags_marshalling.a
TukeyComputation: /opt/or-tools/lib/libabsl_flags_reflection.a
TukeyComputation: /opt/or-tools/lib/libabsl_flags_config.a
TukeyComputation: /opt/or-tools/lib/libabsl_flags_program_name.a
TukeyComputation: /opt/or-tools/lib/libabsl_flags_private_handle_accessor.a
TukeyComputation: /opt/or-tools/lib/libabsl_flags_commandlineflag.a
TukeyComputation: /opt/or-tools/lib/libabsl_flags_commandlineflag_internal.a
TukeyComputation: /opt/or-tools/lib/libabsl_log_initialize.a
TukeyComputation: /opt/or-tools/lib/libabsl_log_internal_message.a
TukeyComputation: /opt/or-tools/lib/libabsl_examine_stack.a
TukeyComputation: /opt/or-tools/lib/libabsl_log_internal_format.a
TukeyComputation: /opt/or-tools/lib/libabsl_log_internal_proto.a
TukeyComputation: /opt/or-tools/lib/libabsl_log_internal_nullguard.a
TukeyComputation: /opt/or-tools/lib/libabsl_log_internal_log_sink_set.a
TukeyComputation: /opt/or-tools/lib/libabsl_log_globals.a
TukeyComputation: /opt/or-tools/lib/libabsl_log_internal_globals.a
TukeyComputation: /opt/or-tools/lib/libabsl_log_sink.a
TukeyComputation: /opt/or-tools/lib/libabsl_log_entry.a
TukeyComputation: /opt/or-tools/lib/libabsl_random_distributions.a
TukeyComputation: /opt/or-tools/lib/libabsl_random_seed_sequences.a
TukeyComputation: /opt/or-tools/lib/libabsl_random_internal_pool_urbg.a
TukeyComputation: /opt/or-tools/lib/libabsl_random_internal_randen.a
TukeyComputation: /opt/or-tools/lib/libabsl_random_internal_randen_hwaes.a
TukeyComputation: /opt/or-tools/lib/libabsl_random_internal_randen_hwaes_impl.a
TukeyComputation: /opt/or-tools/lib/libabsl_random_internal_randen_slow.a
TukeyComputation: /opt/or-tools/lib/libabsl_random_internal_platform.a
TukeyComputation: /opt/or-tools/lib/libabsl_random_internal_seed_material.a
TukeyComputation: /opt/or-tools/lib/libabsl_random_seed_gen_exception.a
TukeyComputation: /opt/or-tools/lib/libabsl_raw_hash_set.a
TukeyComputation: /opt/or-tools/lib/libabsl_hashtablez_sampler.a
TukeyComputation: /opt/or-tools/lib/libabsl_hash.a
TukeyComputation: /opt/or-tools/lib/libabsl_city.a
TukeyComputation: /opt/or-tools/lib/libabsl_low_level_hash.a
TukeyComputation: /opt/or-tools/lib/libabsl_leak_check.a
TukeyComputation: /opt/or-tools/lib/libabsl_statusor.a
TukeyComputation: /opt/or-tools/lib/libabsl_status.a
TukeyComputation: /opt/or-tools/lib/libabsl_cord.a
TukeyComputation: /opt/or-tools/lib/libabsl_cordz_info.a
TukeyComputation: /opt/or-tools/lib/libabsl_cord_internal.a
TukeyComputation: /opt/or-tools/lib/libabsl_cordz_functions.a
TukeyComputation: /opt/or-tools/lib/libabsl_exponential_biased.a
TukeyComputation: /opt/or-tools/lib/libabsl_cordz_handle.a
TukeyComputation: /opt/or-tools/lib/libabsl_crc_cord_state.a
TukeyComputation: /opt/or-tools/lib/libabsl_crc32c.a
TukeyComputation: /opt/or-tools/lib/libabsl_crc_internal.a
TukeyComputation: /opt/or-tools/lib/libabsl_crc_cpu_detect.a
TukeyComputation: /opt/or-tools/lib/libabsl_bad_optional_access.a
TukeyComputation: /opt/or-tools/lib/libabsl_strerror.a
TukeyComputation: /opt/or-tools/lib/libabsl_bad_variant_access.a
TukeyComputation: /opt/or-tools/lib/libabsl_str_format_internal.a
TukeyComputation: /opt/or-tools/lib/libabsl_synchronization.a
TukeyComputation: /opt/or-tools/lib/libabsl_stacktrace.a
TukeyComputation: /opt/or-tools/lib/libabsl_symbolize.a
TukeyComputation: /opt/or-tools/lib/libabsl_debugging_internal.a
TukeyComputation: /opt/or-tools/lib/libabsl_demangle_internal.a
TukeyComputation: /opt/or-tools/lib/libabsl_graphcycles_internal.a
TukeyComputation: /opt/or-tools/lib/libabsl_malloc_internal.a
TukeyComputation: /opt/or-tools/lib/libabsl_time.a
TukeyComputation: /opt/or-tools/lib/libabsl_strings.a
TukeyComputation: /opt/or-tools/lib/libabsl_strings_internal.a
TukeyComputation: /opt/or-tools/lib/libabsl_base.a
TukeyComputation: /opt/or-tools/lib/libabsl_spinlock_wait.a
TukeyComputation: /opt/or-tools/lib/libabsl_throw_delegate.a
TukeyComputation: /opt/or-tools/lib/libabsl_int128.a
TukeyComputation: /opt/or-tools/lib/libabsl_civil_time.a
TukeyComputation: /opt/or-tools/lib/libabsl_time_zone.a
TukeyComputation: /opt/or-tools/lib/libabsl_bad_any_cast_impl.a
TukeyComputation: /opt/or-tools/lib/libabsl_raw_logging_internal.a
TukeyComputation: /opt/or-tools/lib/libabsl_log_severity.a
TukeyComputation: /opt/or-tools/lib/libprotobuf.a
TukeyComputation: /opt/or-tools/lib/libre2.a
TukeyComputation: /opt/or-tools/lib/libCbcSolver.a
TukeyComputation: /opt/or-tools/lib/libOsiCbc.a
TukeyComputation: /opt/or-tools/lib/libCbc.a
TukeyComputation: /opt/or-tools/lib/libCgl.a
TukeyComputation: /opt/or-tools/lib/libClpSolver.a
TukeyComputation: /opt/or-tools/lib/libOsiClp.a
TukeyComputation: /opt/or-tools/lib/libClp.a
TukeyComputation: /opt/or-tools/lib/libOsi.a
TukeyComputation: /opt/or-tools/lib/libCoinUtils.a
TukeyComputation: /opt/or-tools/lib/libscip.a
TukeyComputation: /opt/or-tools/lib/libz.a
TukeyComputation: CMakeFiles/TukeyComputation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jossian/repository/tukey_depth/TukeyDepth/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Linking CXX executable TukeyComputation"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TukeyComputation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TukeyComputation.dir/build: TukeyComputation
.PHONY : CMakeFiles/TukeyComputation.dir/build

CMakeFiles/TukeyComputation.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TukeyComputation.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TukeyComputation.dir/clean

CMakeFiles/TukeyComputation.dir/depend:
	cd /home/jossian/repository/tukey_depth/TukeyDepth/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jossian/repository/tukey_depth/TukeyDepth /home/jossian/repository/tukey_depth/TukeyDepth /home/jossian/repository/tukey_depth/TukeyDepth/build /home/jossian/repository/tukey_depth/TukeyDepth/build /home/jossian/repository/tukey_depth/TukeyDepth/build/CMakeFiles/TukeyComputation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/TukeyComputation.dir/depend
