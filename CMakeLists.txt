cmake_minimum_required(VERSION 3.4)
project(ARToolKit)

# Append to CMAKE_MODULE_PATH the ./cmake folder which contains some usefull findPackage
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake/Modules/")

set(ARTK_VERSION "5.3.1")

set(BUILD_SHARED_LIBS ON)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

set(BUILD_EXAMPLES ON CACHE BOOL "Build the examples")

if (NOT CMAKE_BUILD_TYPE)
    message(STATUS "Setting build type to 'Debug' as none was specified.")
    set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Choose the type of build." FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release")
endif()

#Looking for OpenCV
find_package(OpenCV REQUIRED )
include_directories(${OpenCV_INCLUDE_DIRS})

#Looking for GLUT
#TODO: check if realy mandatory
find_package(GLUT REQUIRED )
include_directories(${GLUT_INCLUDE_DIR})

# Looking for OpenGL
find_package(OpenGL REQUIRED)
include_directories(${OPENGL_HEADER})

#Looking for libjpeg
find_package(JPEG REQUIRED)
include_directories(${JPEG_INCLUDE_DIR})


set(DEFAULT_VIDEO_BACKEND "None" CACHE STRING "Choose the video capture module")
#set the jpeg image backend (all platforms)
set_property(CACHE DEFAULT_VIDEO_BACKEND PROPERTY STRINGS "Image")

set(VIDEO_BACKEND_LIBS "")

if(APPLE)
    set_property(CACHE DEFAULT_VIDEO_BACKEND PROPERTY STRINGS "QuickTime" "Cam1394_Mac")

    set(USE_QUICKTIME ON CACHE BOOL "Build the Quicktime backend ?")
    set(USE_CAM1394_MAC OFF CACHE BOOL "Build the CAM1394_MAC backend ?")

endif()

if(UNIX AND NOT ANDROID AND NOT APPLE)
    set_property(CACHE DEFAULT_VIDEO_BACKEND PROPERTY STRINGS "GStreamer" "Video4Linux" "Video4Linux2" "dc1394v1" "dc1394v2")

    set(USE_GSTREAMER ON CACHE BOOL "Build the GStreamer backend ?")
    set(USE_V4Lv1 OFF CACHE BOOL "Build the Video4Linux v1 backend ?")
    set(USE_V4Lv2 OFF CACHE BOOL "Build the Video4Linux v2 backend ?")
    set(USE_CAM1394_LINUXv1 OFF CACHE BOOL "Build the CAM1394_LINUX v1 backend ?")
    set(USE_CAM1394_LINUXv2 OFF CACHE BOOL "Build the CAM1394_LINUX v2 backend ?")

endif(UNIX AND NOT ANDROID AND NOT APPLE)

if(WIN32)
    set_property(CACHE DEFAULT_VIDEO_BACKEND PROPERTY STRINGS "MediaFondation" "DirectShow")

    set(USE_MEDIAFONDATION ON CACHE BOOL "Build the Media fondation backend ?")
    set(USE_DIRECTSHOW OFF CACHE BOOL "Build the Direct Show backend ?")

endif()

if(ANDROID)
    #TODO
endif()

#TODO others platforms (iOS, ...)

#This is usefull to enable the desired video backend
#define all variables to OFF

set(VIDEO_BACKEND_LIBS)
#Check for the required video libs
include(${CMAKE_SOURCE_DIR}/cmake/videoBackend.cmake)

#LINUX
if(DEFAULT_VIDEO_BACKEND STREQUAL "GStreamer")

    set(AR_DEFAULT_INPUT_GSTREAMER ON)

elseif(DEFAULT_VIDEO_BACKEND STREQUAL "Video4Linux")

    set(AR_DEFAULT_INPUT_V4L ON)

elseif(DEFAULT_VIDEO_BACKEND STREQUAL "Video4Linux2")

    set(AR_DEFAULT_INPUT_V4L2 ON)

elseif(DEFAULT_VIDEO_BACKEND STREQUAL "dc1394v2")

    set(AR_DEFAULT_INPUT_1394CAM ON)
    set(AR_INPUT_1394CAM_USE_LIBDC1394_V2 ON)

#APPLE
elseif(DEFAULT_VIDEO_BACKEND STREQUAL "QuickTime")

    set(AR_DEFAULT_INPUT_QUICKTIME7 ON)

elseif(DEFAULT_VIDEO_BACKEND STREQUAL "Cam1394_Mac")
    set(AR_INPUT_1394CAM ON)

#Windows
elseif(DEFAULT_VIDEO_BACKEND STREQUAL "MediaFondation")

    set(AR_DEFAULT_INPUT_WINDOWS_MEDIA_FOUNDATION ON)


elseif(DEFAULT_VIDEO_BACKEND STREQUAL "DirectShow")

    set(AR_DEFAULT_INPUT_WINDOWS_DIRECTSHOW ON)

#General
elseif(DEFAULT_VIDEO_BACKEND STREQUAL "Image")
    set(AR_DEFAULT_INPUT_IMAGE ON)

#Others cases like "None"
else()
    set(AR_DEFAULT_INPUT_DUMMY ON)
endif()

set(AR_DEFAULT_INPUT_DUMMY OFF)
set(AR_DEFAULT_INPUT_IMAGE ON)

if(BUILD_EXAMPLES)
    set(ENABLE_VRML_RENDER_EXAMPLES OFF CACHE BOOL "Enable VRML Render and Examples.")
    set(ENABLE_OSG_RENDER_EXAMPLES OFF CACHE BOOL "Enable OpenSceneGraph Render and Examples.")
endif()

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
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.7")
            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --std=c++0x")
        else()
            set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --std=c++11")
        endif()
    endif()

    if(APPLE)
       set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --stdlib=libc++")
    endif(APPLE)
endif()

set(ARTK_INCLUDE_DIR "${ARToolKit_SOURCE_DIR}/include")

#Configuration of config.h with all options of the CMakeLists
message(STATUS "---------------- ARTooolkit options : -------------")
message(STATUS "**** General ****")
message(STATUS " * Build Type     : ${CMAKE_BUILD_TYPE}")
message(STATUS " * Build Examples : ${BUILD_EXAMPLES}")
message(STATUS " * Build Shared   : ${BUILD_SHARED_LIBS}")

message(STATUS "**** Video ****")
message(STATUS " * Video Backend         : ${DEFAULT_VIDEO_BACKEND} ")
message(STATUS " * Enabled Video Backend : ${VIDEO_BACKEND_LIBS}")

message(STATUS "**** Required Libraries ****")
message(STATUS " * Found OpenGL   : ${OPENGL_FOUND} ")
message(STATUS " * Found GLUT     : ${GLUT_FOUND} ")
message(STATUS " * Found OpenCV   : ${OpenCV_FOUND}")
message(STATUS " * Found jpeg     : ${JPEG_FOUND}")
message(STATUS "---------------------------------------------------")


configure_file(${ARTK_INCLUDE_DIR}/AR/config.h.in ${ARTK_INCLUDE_DIR}/AR/config.h)

#parsing of src
add_subdirectory(./lib/SRC)
if(BUILD_EXAMPLES)
add_subdirectory(./examples)
endif()
