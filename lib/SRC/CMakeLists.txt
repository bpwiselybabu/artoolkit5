# Core library
add_subdirectory(./Core)

# Video libraries
# LINUX
if(UNIX AND NOT ANDROID AND NOT APPLE)

    if(USE_GSTREAMER)
        add_subdirectory(./VideoGStreamer)
    endif()

    if(USE_V4Lv1)
        add_subdirectory(./VideoLinuxV4L)
    endif()

    if(USE_V4Lv2)
        add_subdirectory(./VideoLinuxV4L2)
    endif()

    if(USE_CAM1394_LINUXv1 OR USE_CAM1394_LINUXv2)
        add_subdirectory(./VideoLinux1394Cam)
    endif()

endif()

#APPLE
if(APPLE)

    if(USE_QUICKTIME)
         add_subdirectory(./videoQuickTime7)
    endif()

    if(USE_CAM1394_MAC)
    endif()

endif()

#WINDOWS
if(WIN32)

    if(USE_MEDIAFONDATION)
        add_subdirectory(./VideoWinMF)
    endif()

    if(USE_DIRECTSHOW)
        add_subdirectory(./VideoWinDS)
    endif()

endif()

# Others libraries
add_subdirectory(./Util)
add_subdirectory(./ARICP)
add_subdirectory(./Video)
add_subdirectory(./AR)
add_subdirectory(./AR2)
add_subdirectory(./KPM)
add_subdirectory(./Gl)
add_subdirectory(./ARMulti)
#add_subdirectory(./ARWrapper)
