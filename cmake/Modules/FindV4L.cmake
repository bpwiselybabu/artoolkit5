############################################################################
#
# - Find the V4L include file and library
#
#  V4L_FOUND - system has V4L
#  V4L_INCLUDE_DIRS - the V4L include directory
#  V4L_LIBRARIES - The libraries needed to use V4L
#  V4L_VERSION - Version '1' or '2'



set(V4L_VERSION 0)

find_path(V4L1_INCLUDE_DIRS
	NAMES linux/videodev.h
	HINTS /usr
        /usr/local
	PATH_SUFFIXES include
)
if(V4L1_INCLUDE_DIRS)
	set(HAVE_LINUX_VIDEODEV_H 1)
endif()
find_path(V4L2_INCLUDE_DIRS
	NAMES linux/videodev2.h
	HINTS /usr
    /usr/local
	PATH_SUFFIXES include
)
if(V4L2_INCLUDE_DIRS)
	set(HAVE_LINUX_VIDEODEV2_H 1)
endif()

find_library(V4L1_LIBRARIES
	NAMES v4l1
	HINTS /usr
    /usr/local
    /usr/lib
    /usr/lib/x86_64-linux-gnu
    /usr/local/bin
    /usr/bin
)
find_library(V4L2_LIBRARIES
	NAMES v4l2
	HINTS /usr
    /usr/local
    /usr/lib
    /usr/lib/x86_64-linux-gnu
    /usr/local/bin
    /usr/bin
)
find_library(V4LCONVERT_LIBRARIES
	NAMES v4lconvert
	HINTS /usr
    /usr/local
    /usr/lib
    /usr/lib/x86_64-linux-gnu
    /usr/local/bin
    /usr/bin
)

set(V4L_INCLUDE_DIRS )
if(V4L1_INCLUDE_DIRS})
	list(APPEND V4L_INCLUDE_DIRS ${V4L1_INCLUDE_DIRS})
endif()
if(V4L2_INCLUDE_DIRS)
	list(APPEND V4L_INCLUDE_DIRS ${V4L2_INCLUDE_DIRS})
endif()
set(V4L_LIBRARIES )
if(V4L1_LIBRARIES)
	list(APPEND V4L_LIBRARIES ${V4L1_LIBRARIES})
    set(V4L_VERSION 1)
endif()
if(V4L2_LIBRARIES)
	list(APPEND V4L_LIBRARIES ${V4L2_LIBRARIES})
    set(V4L_VERSION 2)
endif()
if(V4LCONVERT_LIBRARIES)
	list(APPEND V4L_LIBRARIES ${V4LCONVERT_LIBRARIES})
endif()
list(REMOVE_DUPLICATES V4L_INCLUDE_DIRS)
list(REMOVE_DUPLICATES V4L_LIBRARIES)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(V4L
	DEFAULT_MSG
	V4L_INCLUDE_DIRS V4L_LIBRARIES
)

mark_as_advanced(V4L_INCLUDE_DIRS V4L_LIBRARIES)
