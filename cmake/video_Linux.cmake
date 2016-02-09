##############################################
#
# This file configure the linux backend video
#
#

if(USE_GSTREAMER)
    find_package(GStreamer)
    include_directories(${GSTREAMER_INCLUDE_DIRS})
    set(VIDEO_LIB ${GSTREAMER_LIBRARIES})
    set(AR_INPUT_GSTREAMER ON)
    list(APPEND VIDEO_BACKEND_LIBS "ARTKVideoGStreamer")
endif()

if(USE_V4Lv1)
    find_package(V4L)

    if(V4L_VERSION EQUAL 1)
        set(VIDEO_LIB ${V4L_LIBRARIES})
        include_directories(${V4L_INCLUDE_DIRS})

        set(AR_INPUT_V4L ON)
        list(APPEND VIDEO_BACKEND_LIBS "ARTKVideoLinuxV4L")

    else()
        message(FATAL_ERROR "You choose Video4Linux has default backend but video4Linux was not found on your system,
            maybe you looking for video4Linux v2 ?")
    endif()
endif()

if(USE_V4Lv2)
    find_package(V4L)
    if(V4L_VERSION EQUAL 2)
        set(VIDEO_LIB ${V4L_LIBRARIES})
        include_directories(${V4L_INCLUDE_DIRS})

        set(AR_INPUT_V4L2 ON)
        list(APPEND VIDEO_BACKEND_LIBS "ARTKVideoLinuxV4L2")

    else()
        message(FATAL_ERROR "You choose Video4Linux2 has default backend but video4Linux2 was not found on your system,
            maybe you looking for video4Linux v1 ?")
    endif()
endif()

if(USE_CAM1394_LINUXv1)
    #TODO
    message(WARNING "The option 'USE_CAM1394_LINUXv1' is not supported for the moment.")
endif()

if(USE_CAM1394_LINUXv2)
    find_package(DC1394)
    set(VIDEO_LIB ${DC1394_LIBRARIES})
    include_directories(${DC1394_INCLUDE_DIR})
    set(AR_INPUT_CAM1394 ON)
    list(APPEND VIDEO_BACKEND_LIBS "ARTKVideoLinux1394Cam")
endif()

