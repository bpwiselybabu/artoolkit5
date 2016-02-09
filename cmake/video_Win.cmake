##############################################
#
# This file configure the Windows backend video
#
#

if(USE_MEDIAFONDATION)
    find_package(MediaFoundation REQUIRED)
    set(VIDEO_LIB ${MEDIAFOUNDATION_LIBRARIES})
    include_directories(${MEDIAFOUNDATION_INCLUDE_DIR})

    set(AR_INPUT_WINDOWS_MEDIA_FOUNDATION ON)
    list(APPEND VIDEO_BACKEND_LIBS "ARTKVideoMediaFondation")
endif()

if(USE_DIRECTSHOW)
    find_package(DirectShow REQUIRED)
    set(VIDEO_LIB ${DIRECTSHOW_LIBRARIES})
    include_directories(${DIRECTSHOW_INCLUDE_DIR})

    set(AR_INPUT_WINDOWS_DIRECTSHOW ON)

    list(APPEND VIDEO_BACKEND_LIBS "ARTKVideoDirectShow")

endif()
