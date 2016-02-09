# set the general input video (jpeg image and dummy)
set(AR_INPUT_IMAGE ON)
set(AR_INPUT_DUMMY)

# then specify the backend for each plateform
if(APPLE)
    include(${CMAKE_SOURCE_DIR}/cmake/video_OSX.cmake)
elseif(UNIX AND NOT ANDROID)
    include(${CMAKE_SOURCE_DIR}/cmake/video_Linux.cmake)
elseif(WIN32)
    include(${CMAKE_SOURCE_DIR}/cmake/video_Win.cmake)
endif()

