cmake_minimum_required(VERSION 3.5)

project(network)

message(STATUS "CMAKE_BUILD_TYPE:${CMAKE_BUILD_TYPE}")
message(STATUS "MyProjectName:${MyProjectName}")

# 设置语言标准
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED On)

set(CMAKE_EXPORT_COMPILE_COMMANDS On)

set(CMAKE_CXX_FLAGS "-Wall")
set(CMAKE_CXX_FLAGS_DEBUG "-D_DEBUG -O0 -g -ggdb")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG")

# 设置库的生成路径
set(LIBRARY_OUTPUT_PATH "../../../lib")
message(STATUS "LIBRARY_OUTPUT_PATH: ${LIBRARY_OUTPUT_PATH}")
set(OBJECT_OUTPUTS)

# 添加库文件
list(
    APPEND SRCS
    network.cc network.h
)

add_library(network_obj OBJECT ${SRCS})

set_target_properties(
    network_obj
    PROPERTIES
    POSITION_INDEPENDENT_CODE 1 # 位置无关（用于生成动态库）
)

add_library(network_static STATIC $<TARGET_OBJECTS:network_obj>)
add_library(network_shared SHARED $<TARGET_OBJECTS:network_obj>)
