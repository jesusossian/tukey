# CMAKE generated file: DO NOT EDIT!
# Generated by CMake Version 3.26
cmake_policy(SET CMP0009 NEW)

# IO_LIB at CMakeLists.txt:25 (file)
file(GLOB NEW_GLOB LIST_DIRECTORIES true "/home/jossian/repository/tukey/seiffarth/Approximation/../libs/libIO/include/*.cpp")
set(OLD_GLOB
  "/home/jossian/repository/tukey/seiffarth/Approximation/../libs/libIO/include/FileEvaluation.cpp"
  "/home/jossian/repository/tukey/seiffarth/Approximation/../libs/libIO/include/StaticFunctions.cpp"
  )
if(NOT "${NEW_GLOB}" STREQUAL "${OLD_GLOB}")
  message("-- GLOB mismatch!")
  file(TOUCH_NOCREATE "/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles/cmake.verify_globs")
endif()

# IO_LIB at CMakeLists.txt:25 (file)
file(GLOB NEW_GLOB LIST_DIRECTORIES true "/home/jossian/repository/tukey/seiffarth/Approximation/../libs/libIO/include/*.h")
set(OLD_GLOB
  "/home/jossian/repository/tukey/seiffarth/Approximation/../libs/libIO/include/FileEvaluation.h"
  "/home/jossian/repository/tukey/seiffarth/Approximation/../libs/libIO/include/StaticFunctions.h"
  "/home/jossian/repository/tukey/seiffarth/Approximation/../libs/libIO/include/io.h"
  )
if(NOT "${NEW_GLOB}" STREQUAL "${OLD_GLOB}")
  message("-- GLOB mismatch!")
  file(TOUCH_NOCREATE "/home/jossian/repository/tukey/seiffarth/Approximation/build/CMakeFiles/cmake.verify_globs")
endif()