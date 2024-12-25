cmake_minimum_required(VERSION 3.10)
project (dio c)


# set compiler
# find_program(CMAKE_C_COMPILER NAMES avr-gcc PATHS "/usr/bin/")
set(CMAKE_C_COMPILER "avr-gcc")

set(${PROJECT_NAME}_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/inc" 

# To get all files .c inside the directory mentioned :: you can use GLOB_RECURSE to loop inside directories   
file(GLOB_RECURSE ${PROJECT_NAME}_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.c")

# just for debugging
message(STATUS "${${PROJECT_NAME}_SOURCES}")
message(STATUS "${CMAKE_C_COMPILER}")


add_library(${PROJECT_NAME} STATIC "${${PROJECT_NAME}_SOURCES}")

target_include_directories(${PROJECT_NAME} PUBLIC "${${PROJECT_NAME}_INCLUDE_DIR}")

