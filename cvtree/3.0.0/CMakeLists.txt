###
# Copyright (c) 2018  T-Life Research Center, Fudan University, Shanghai, China.
# See the accompanying Manual for the contributors and the way to cite this work.
# Comments and suggestions welcome. Please contact
# Dr. Guanghong Zuo <ghzuo@fudan.edu.cn>
# 
# @Author: Dr. Guanghong Zuo
# @Date: 2017-09-01 16:22:53
# @Last Modified By: Dr. Guanghong Zuo
# @Last Modified Time: 2022-12-24 17:19:03
###

cmake_minimum_required(VERSION 3.0)
#cmake_policy(SET CMP0012 NEW)
project (CVTree)
enable_language(CXX)

## For Compile
##########################################################
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)
LINK_DIRECTORIES(${LIBRARY_OUTPUT_PATH})
SET(CMAKE_VERBOSE_MAKEFILE on)
ADD_DEFINITIONS("-O3 -std=c++11")
#set(CMAKE_FIND_LIBRARY_SUFFIXES .a .tbd .dylib .so)

### use CANDA library
if (NOT $ENV{CONDA_PREFIX} STREQUAL "")
  message(STATUS "CURRENT CONDA PREFIX: $ENV{CONDA_PREFIX}")
  include_directories(BEFORE $ENV{CONDA_PREFIX}/include)
  # link_directories(BEFORE $ENV{CONDA_PREFIX}/lib)
endif ()

### Check required LIABRARIES
set(REQUIRED_LIBRARIES ${REQUIRED_LIBRARIES} z)
foreach(LIB ${REQUIRED_LIBRARIES})
  find_library(THE${LIB} ${LIB})
  if(THE${LIB})
    message("-- Found library " ${LIB} ": " ${THE${LIB}})
    LINK_LIBRARIES(${LIB})
  else()
    message(FATAL_ERROR ${LIB} " library not found!")
  endif()
endforeach()

### find the nlohmann json
find_package(nlohmann_json 3.6 REQUIRED)

### Check the OPENMP
find_package(OpenMP REQUIRED)
if (OPENMP_FOUND)
  set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
  if (APPLE)
    set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -L/usr/local/lib -lomp")
  endif ()
endif()

### Check HDF5
find_path(HDF5_INCLUDE NAMES H5Cpp.h)
find_library(HDF5_LIBRARY hdf5)
find_library(HDF5_CXX_LIBRARY hdf5_cpp)
if(HDF5_INCLUDE AND HDF5_LIBRARY AND HDF5_CXX_LIBRARY)
  ADD_DEFINITIONS("-D_HDF5")
  message("-- Found HDF5_CPP Include file: " ${HDF5_INCLUDE})
  INCLUDE_DIRECTORIES(${HDF5_INCLUDE})
  message("-- Found HDF5 Library: " ${HDF5_LIBRARY})
  LINK_LIBRARIES(${HDF5_LIBRARY})
  message("-- Found HDF5_CPP Library: " ${HDF5_CXX_LIBRARY})
  LINK_LIBRARIES(${HDF5_CXX_LIBRARY})
else()
  message("-- HDF5 format will not support!")
endif()

### Check NetCDF
find_path(NETCDF_INCLUDE netcdfcpp.h)
find_library(NETCDF_LIBRARY netcdf_c++)
if(NETCDF_INCLUDE AND NETCDF_LIBRARY)
  ADD_DEFINITIONS("-D_NETCDF")
  message("-- Found NETCDF_CPP Include file: " ${NETCDF_INCLUDE})
  INCLUDE_DIRECTORIES(${NETCDF_INCLUDE})
  message("-- Found NETCDF Library: " ${NETCDF_LIBRARY})
  LINK_LIBRARIES(${NETCDF_LIBRARY})
else()
  message("-- netCDF format will not support!")
endif()

## include subdirectories
ADD_SUBDIRECTORY(kit)
ADD_SUBDIRECTORY(cvtree)

