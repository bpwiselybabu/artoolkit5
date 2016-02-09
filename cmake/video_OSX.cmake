##############################################
#
# This file configure the OSX backend video
#
#

if(USE_QUICKTIME)
    find_package(QuickTime)
    include_directories(${QUICKTIME_INCLUDE_DIR})
    set(AR_INPUT_QUICKTIME7 ON)
    list(APPEND VIDEO_BACKEND_LIBS "ARTKVideoQuickTime7")
endif()

if(USE_CAM1394_MAC)
    message(WARNING "The option 'USE_CAM1394_MAC' is not supported for the moment.")
endif()



