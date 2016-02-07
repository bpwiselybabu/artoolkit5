cmake_minimum_required(VERSION 3.4)
project(ARToolKit)

#Append to CMAKE_MODULE_PATH the ./cmake folder which should contain FindGStreamer.cmake
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

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
include_directories(${GLUT_HEADER})

# Looking for OpenGL
find_package(OpenGL REQUIRED)
include_directories(${OPENGL_HEADER})

#Looking for libjpeg
find_package(JPEG REQUIRED)
include_directories(${JPEG_INCLUDE_DIR})

set(VIDEO_BACKEND "None" CACHE STRING "Choose the video capture module")

if(APPLE)
    set_property(CACHE VIDEO_BACKEND PROPERTY STRINGS "QuickTime" "Cam1394_Mac")
endif()

if(UNIX AND NOT ANDROID AND NOT APPLE)
    set_property(CACHE VIDEO_BACKEND PROPERTY STRINGS "GStreamer" "Video4Linux" "Video4Linux2" "Cam1394_Linux")
endif(UNIX AND NOT ANDROID AND NOT APPLE)

if(WIN32)
    set_property(CACHE VIDEO_BACKEND PROPERTY STRINGS "MediaFondation" "DirectShow")
endif()


#This is usefull to enable the desired video backend
#define all variables to OFF
set(VIDEO_BACKEND_LIBS)
#LINUX
set(VIDEO_LIB)
#  Detect 3rd-party video IO libraries
if(VIDEO_BACKEND STREQUAL "GStreamer")
    find_package(GStreamer)
    include_directories(${GSTREAMER_INCLUDE_DIRS})
    set(VIDEO_LIB ${GSTREAMER_LIBRARIES})

    set(AR_INPUT_GSTREAMER ON)
    set(AR_DEFAULT_INPUT_GSTREAMER ON)

    set(VIDEO_BACKEND_LIBS "ARVideoGStreamer")

elseif(VIDEO_BACKEND STREQUAL "Video4Linux")
    find_package(V4L)
    set(VIDEO_LIB ${Video4Linux_LIB})
    include_directories(${Video4Linux_HEADER})

    set(AR_INPUT_V4L ON)
    set(AR_DEFAULT_INPUT_V4L ON)

    set(VIDEO_BACKEND_LIBS "ARVideoLinuxV4L")

elseif(VIDEO_BACKEND STREQUAL "Cam1394_Linux")
    find_package(lib1394dc)
    set(VIDEO_LIB ${lib1394dc_LIB})
    include_directories(${lib1394dc_HEADER})
    set(AR_INPUT_CAM1394 ON)
    set(AR_DEFAULT_INPUT_1394CAM ON)

    set(VIDEO_BACKEND_LIBS "ARVideoLinux1394Cam")

elseif(VIDEO_BACKEND STREQUAL "Video4Linux2")
    #TODO
    find_package(V4L2)
    set(VIDEO_LIB ${V4L2_LIB})
    include_directories(${V4L2_HEADER})

    set(AR_INPUT_V4L2 ON)
    set(AR_DEFAULT_INPUT_V4L2 ON)

    set(VIDEO_BACKEND_LIBS "ARVideoLinuxV4L2")

#APPLE
elseif(VIDEO_BACKEND STREQUAL "QuickTime")
    find_package(QuickTime)
    set(VIDEO_LIB ${QUICKTIME_LIBRARY})
    include_directories(${QUICKTIME_INCLUDE_DIR})

    set(AR_INPUT_QUICKTIME7 ON)
    set(AR_DEFAULT_INPUT_QUICKTIME7 ON)

    set(VIDEO_BACKEND_LIBS "ARVideoQuickTime7")
    #TODO

elseif(VIDEO_BACKEND STREQUAL "Cam1394_Mac")
    #TODO
#Windows
elseif(VIDEO_BACKEND STREQUAL "MediaFondation")
    find_package(MediaFoundation REQUIRED)
    set(VIDEO_LIB ${MEDIAFOUNDATION_LIBRARIES})
    include_directories(${MEDIAFOUNDATION_INCLUDE_DIR})

    set(AR_INPUT_WINDOWS_MEDIA_FOUNDATION ON)
    set(AR_DEFAULT_INPUT_WINDOWS_MEDIA_FOUNDATION ON)
    
    set(VIDEO_BACKEND_LIBS "MediaFondation")
elseif(VIDEO_BACKEND STREQUAL "DirectShow")
    find_package(DirectShow REQUIRED)
    set(VIDEO_LIB ${DIRECTSHOW_LIBRARIES})
    include_directories(${DIRECTSHOW_INCLUDE_DIR})

    set(AR_INPUT_WINDOWS_DIRECTSHOW ON)
    set(AR_DEFAULT_INPUT_WINDOWS_DIRECTSHOW ON)
    
    set(VIDEO_BACKEND_LIBS "DirectShow")
#Others cases like "None"
else()
    #TODO
    set(VIDEO_BACKEND_LIBS "ARVideoWinDummy")
endif()

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
message(STATUS "---------------- ARTooolkit options : -------------")
message(STATUS " * Build Type     : ${CMAKE_BUILD_TYPE}")
message(STATUS " * Build Examples : ${BUILD_EXAMPLES}")
message(STATUS " * Build Shared   : ${BUILD_SHARED_LIBS}")

message(STATUS " * Video Backend  : ${VIDEO_BACKEND} ")
message(STATUS " * Found OpenGL   : ${OPENGL_FOUND} ")
message(STATUS " * Found GLUT     : ${GLUT_FOUND} ")
message(STATUS " * Found OpenCV   : ${OpenCV_FOUND}")
message(STATUS " * Found jpeg     : ${JPEG_FOUND}")


configure_file(${ARTK_INCLUDE_DIR}/AR/config.h.in ${ARTK_INCLUDE_DIR}/AR/config.h)

#parsing of src
add_subdirectory(./lib/SRC)
add_subdirectory(./examples)
