cmake_minimum_required(VERSION 3.10)
project (dio)
add_library(dio STATIC src/dio.c)
target_include_directories(dio PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc)

