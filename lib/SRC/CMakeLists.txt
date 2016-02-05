add_subdirectory(./Core)

if(UNIX AND NOT ANDROID AND NOT APPLE)
    if(VIDEO_BACKEND STREQUAL "GStreamer")
        add_subdirectory(./VideoGStreamer)
    elseif(VIDEO_BACKEND STREQUAL "Video4Linux")
        add_subdirectory(./VideoV4L)
    elseif(VIDEO_BACKEND STREQUAL "Cam1394_Linux")
        add_subdirectory(./VideoLinux1394Cam)
    endif()
endif()

if(APPLE)
    if(VIDEO_BACKEND STREQUAL "QuickTime")
        add_subdirectory(./videoQuickTime7)
    elseif(VIDEO_BACKEND STREQUAL "Cam1394_Mac")
        #TODO
  endif()
endif()


add_subdirectory(./Util)
add_subdirectory(./ARICP)
add_subdirectory(./Video)
add_subdirectory(./AR)
add_subdirectory(./AR2)
add_subdirectory(./KPM)
add_subdirectory(./Gl)
