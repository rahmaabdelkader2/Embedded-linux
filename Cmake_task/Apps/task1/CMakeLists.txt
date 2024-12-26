cmake_minimum_required(VERSION 3.10)
project (task1 c)

# include directories
set(${PROJECT_NAME}_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/inc" 

# To get all files .c inside the directory mentioned :: you can use GLOB_RECURSE to loop inside directories   
file(GLOB_RECURSE ${PROJECT_NAME}_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.c")


# just for debugging
message(STATUS "${${PROJECT_NAME}_SOURCES}")
message(STATUS "${CMAKE_C_COMPILER}")

foreach(var ${MCAL_LIBS})

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../../Components/MCAL/${var}/ "${CMAKE_BINARY_DIR}/${var}/")

endforeach()


# Set compiler flag after sub directories
set(CMAKE_C_COMPILER "avr-gcc")

# library target
add_executable(${PROJECT_NAME} "${${PROJECT_NAME}_SOURCES}")

# include directory to the target
target_include_directories(${PROJECT_NAME} PUBLIC "${${PROJECT_NAME}_INCLUDE_DIR}")
target_link_libraries(${PROJECT_NAME} dio)

add_custom_target(
    avr-hex
    COMMAND avr-objcopy -O ihex ${PROJECT_NAME} ${PROJECT_NAME}.hex
    DEPENDS ${PROJECT_NAME}
)
