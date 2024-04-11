cmake_minimum_required(VERSION 3.7)

if(${CMAKE_VERSION} VERSION_LESS 3.29)
    cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
else()
    cmake_policy(VERSION 3.29)
endif()

find_package(fmt REQUIRED HINTS "vendor/fmt/build/")

project(App
    VERSION 0.1
    DESCRIPTION "a very nice Template"
    LANGUAGES CXX
)

add_executable(App
    "src/main.cpp"
)

target_link_libraries(App
    fmt::fmt
)

set_target_properties(App 
    PROPERTIES
    CXX_STANDARD 20
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
)
