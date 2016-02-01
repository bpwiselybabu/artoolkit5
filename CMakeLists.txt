cmake_minimum_required(VERSION 3.1)
project(ARToolKit)

#Append to CMAKE_MODULE_PATH the ./cmake folder which should contain FindGStreamer.cmake
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

set(ARTK_VERSION "5.3.1")

set(BUILD_SHARED_LIBS ON)
set(ARTK_BUILD_TYPE ${CMAKE_BUILD_TYPE})

#Looking for OpenCV
find_package(OpenCV REQUIRED )
include_directories(${OpenCV_INCLUDE_DIRS})

#Looking for GLUT
#TODO: check if realy mandatory
find_package(GLUT REQUIRED )
include_directories(${GLUT_HEADER})

if(UNIX AND NOT ANDROID)

    set(ENABLE_GSTREAMER ON CACHE BOOL "Enable Gstreamer capture module.")
    set(ENABLE_V4L OFF CACHE BOOL "Enable Video4Linux Capture module.")
    set(ENABLE_CAM1394 OFF CACHE BOOL "Enable the IEEE 1394 Digital Video Camera capture module.")

    if(ENABLE_GSTREAMER OR ENABLE_V4L OR ENABLE_CAM1394)
        set(DEFAULT_CAP_DEVICE "GStreamer" CACHE STRING "Choose the default input device." FORCE)
        set_property(CACHE DEFAULT_CAP_DEVICE PROPERTY STRINGS "GStreamer" "V4L" "CAM1394")
    endif()

    #This is usefull to enable the desired video backend
    #define all variables to OFF

    set(LINUX_VIDEO_LIB)
    #  Detect 3rd-party video IO libraries
    if(DEFAULT_CAP_DEVICE STREQUAL "GStreamer")
        find_package(GStreamer)
        include_directories(${GSTREAMER_INCLUDE_DIRS})
        set(LINUX_VIDEO_LIB ${GSTREAMER_LIBRARIES})

        set(AR_INPUT_GSTREAMER ON)
        set(AR_DEFAULT_INPUT_GSTREAMER ON)

    elseif(DEFAULT_CAP_DEVICE STREQUAL "V4L")
        find_package(V4L)
        set(LINUX_VIDEO_LIB ${Video4Linux_LIB})
        include_directories(${Video4Linux_HEADER})

        set(AR_INPUT_V4L ON)
        set(AR_DEFAULT_INPUT_V4L ON)

    elseif(DEFAULT_CAP_DEVICE STREQUAL "CAM1394")
        find_package(lib1394dc)
        set(LINUX_VIDEO_LIB ${lib1394dc_LIB})
        include_directories(${lib1394dc_HEADER})
        set(AR_INPUT_CAM1394 ON)
        set(AR_DEFAULT_INPUT_1394CAM ON)
    endif()

endif(UNIX AND NOT ANDROID)

set(ENABLE_VRML_RENDER_EXAMPLES OFF CACHE BOOL "Enable VRML Render and Examples.")
set(ENABLE_OSG_RENDER_EXAMPLES OFF CACHE BOOL "Enable OpenSceneGraph Render and Examples.")

## Generate definitions
#TODO: This is not used for the moment
if(${DRAGON})
    set(AR_INPUT_1394CAM_USE_DRAGONFLY ON)
endif()

if(${COLOR_1394})
    set(AR_INPUT_1394CAM_DEFAULT_PIXEL_FORMAT "AR_PIXEL_FORMAT_RGB")
else()
    set(AR_INPUT_1394CAM_DEFAULT_PIXEL_FORMAT "AR_PIXEL_FORMAT_MONO")
endif()

if(${DC1394_V2})
    set(AR_INPUT_1394CAM_USE_LIBDC1394_V2 ON)
endif()

if(${INPUT_DV})
    set(AR_INPUT_DV ON)
endif()

if(${INPUT_CAM1394_MAC})
    set(AR_INPUT_1394CAM ON)
endif()

if(${INPUT_IMAGE})
    set(AR_INPUT_IMAGE ON)
endif()

# Globaly enabled c++11
if(NOT WIN32)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --std=c++11")
    if(APPLE)
       set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --stdlib=libc++")
    endif(APPLE)
endif()

set(ARTK_INCLUDE_DIR "${ARToolKit_SOURCE_DIR}/include")

#Configuration of config.h with all options of the CMakeLists
message(STATUS "---------------- options : -------------")
message(STATUS "| AR_INPUT_GSTREAMER : ${AR_INPUT_GSTREAMER}      | ")
message(STATUS "| AR_DEFAULT_INPUT_GSTREAMER : ${AR_DEFAULT_INPUT_GSTREAMER}    | ")
message(STATUS "| AR_INPUT_V4L : ${AR_INPUT_V4L}      | ")
message(STATUS "| AR_DEFAULT_INPUT_V4L : ${AR_DEFAULT_INPUT_V4L}    | ")
message(STATUS "| AR_INPUT_CAM1394 : ${AR_INPUT_CAM1394}      | ")
message(STATUS "| AR_DEFAULT_INPUT_CAM1394 : ${AR_DEFAULT_INPUT_CAM1394}    | ")

configure_file(${ARTK_INCLUDE_DIR}/AR/config.h.in ${ARTK_INCLUDE_DIR}/AR/config.h)

#parsing of src
add_subdirectory(./lib/SRC)
