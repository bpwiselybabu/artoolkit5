# - Try to find GStreamer and its plugins
# Once done, this will define
#
#  GSTREAMER_FOUND - system has GStreamer
#  GSTREAMER_INCLUDE_DIRS - the GStreamer include directories
#  GSTREAMER_LIBRARIES - link these to use GStreamer
#
# Additionally, gstreamer-base is always looked for and required, and
# the following related variables are defined:
#
#  GSTREAMER_BASE_INCLUDE_DIRS - gstreamer-base's include directory
#  GSTREAMER_BASE_LIBRARIES - link to these to use gstreamer-base
#
# Optionally, the COMPONENTS keyword can be passed to find_package()
# and GStreamer plugins can be looked for.  Currently, the following
# plugins can be searched, and they define the following variables if
# found:
#
#  gstreamer-app:        GSTREAMER_APP_INCLUDE_DIRS and GSTREAMER_APP_LIBRARIES
#  gstreamer-audio:      GSTREAMER_AUDIO_INCLUDE_DIRS and GSTREAMER_AUDIO_LIBRARIES
#  gstreamer-fft:        GSTREAMER_FFT_INCLUDE_DIRS and GSTREAMER_FFT_LIBRARIES
#  gstreamer-gl:         GSTREAMER_GL_INCLUDE_DIRS and GSTREAMER_GL_LIBRARIES
#  gstreamer-mpegts:     GSTREAMER_MPEGTS_INCLUDE_DIRS and GSTREAMER_MPEGTS_LIBRARIES
#  gstreamer-pbutils:    GSTREAMER_PBUTILS_INCLUDE_DIRS and GSTREAMER_PBUTILS_LIBRARIES
#  gstreamer-tag:        GSTREAMER_TAG_INCLUDE_DIRS and GSTREAMER_TAG_LIBRARIES
#  gstreamer-video:      GSTREAMER_VIDEO_INCLUDE_DIRS and GSTREAMER_VIDEO_LIBRARIES

find_package(PkgConfig)

# Helper macro to find a GStreamer plugin (or GStreamer itself)
#   _component_prefix is prepended to the _INCLUDE_DIRS and _LIBRARIES variables (eg. "GSTREAMER_AUDIO")
#   _pkgconfig_name is the component's pkg-config name (eg. "gstreamer-0.10", or "gstreamer-video-0.10").
#   _library is the component's library name (eg. "gstreamer-0.10" or "gstvideo-0.10")
macro(FIND_GSTREAMER_COMPONENT _component_prefix _pkgconfig_name _library)

    string(REGEX MATCH "(.*)>=(.*)" _dummy "${_pkgconfig_name}")
    if ("${CMAKE_MATCH_2}" STREQUAL "")
        pkg_check_modules(PC_${_component_prefix} "${_pkgconfig_name} >= ${GStreamer_FIND_VERSION}")
    else ()
        pkg_check_modules(PC_${_component_prefix} ${_pkgconfig_name})
    endif ()

    set(${_component_prefix}_INCLUDE_DIRS ${PC_${_component_prefix}_INCLUDE_DIRS})

    find_library(${_component_prefix}_LIBRARIES
        NAMES ${_library}
        HINTS ${PC_${_component_prefix}_LIBRARY_DIRS} ${PC_${_component_prefix}_LIBDIR}
    )
endmacro()

# ------------------------
# 1. Find GStreamer itself
# ------------------------

# 1.1. Find headers and libraries
FIND_GSTREAMER_COMPONENT(GSTREAMER gstreamer-0.10 gstreamer-0.10)
FIND_GSTREAMER_COMPONENT(GSTREAMER_BASE gstreamer-base-0.10 gstbase-0.10)

# -------------------------
# 2. Find GStreamer plugins
# -------------------------
FIND_GSTREAMER_COMPONENT(GSTREAMER_APP gstreamer-app-0.10 gstapp-0.10)
FIND_GSTREAMER_COMPONENT(GSTREAMER_AUDIO gstreamer-audio-0.10 gstaudio-0.10)
FIND_GSTREAMER_COMPONENT(GSTREAMER_FFT gstreamer-fft-0.10 gstfft-0.10)
#FIND_GSTREAMER_COMPONENT(GSTREAMER_GL gstreamer-gl-0.10>=1.5.0 gstgl-0.10)
#FIND_GSTREAMER_COMPONENT(GSTREAMER_MPEGTS gstreamer-mpegts-0.10>=1.4.0 gstmpegts-0.10)
FIND_GSTREAMER_COMPONENT(GSTREAMER_PBUTILS gstreamer-pbutils-0.10 gstpbutils-0.10)
FIND_GSTREAMER_COMPONENT(GSTREAMER_TAG gstreamer-tag-0.10 gsttag-0.10)
FIND_GSTREAMER_COMPONENT(GSTREAMER_VIDEO gstreamer-video-0.10 gstvideo-0.10)

# ------------------------------------------------
# 3. Process the COMPONENTS passed to FIND_PACKAGE
# ------------------------------------------------
set(_GSTREAMER_REQUIRED_VARS GSTREAMER_INCLUDE_DIRS GSTREAMER_LIBRARIES GSTREAMER_VERSION GSTREAMER_BASE_INCLUDE_DIRS GSTREAMER_BASE_LIBRARIES)

foreach (_component ${GStreamer_FIND_COMPONENTS})
    set(_gst_component "GSTREAMER_${_component}")
    string(TOUPPER ${_gst_component} _UPPER_NAME)

    list(APPEND _GSTREAMER_REQUIRED_VARS ${_UPPER_NAME}_INCLUDE_DIRS ${_UPPER_NAME}_LIBRARIES)
endforeach ()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GStreamer REQUIRED_VARS _GSTREAMER_REQUIRED_VARS
                                            VERSION_VAR   GSTREAMER_VERSION)

mark_as_advanced(
    GSTREAMER_APP_INCLUDE_DIRS
    GSTREAMER_APP_LIBRARIES
    GSTREAMER_AUDIO_INCLUDE_DIRS
    GSTREAMER_AUDIO_LIBRARIES
    GSTREAMER_BASE_INCLUDE_DIRS
    GSTREAMER_BASE_LIBRARIES
    GSTREAMER_FFT_INCLUDE_DIRS
    GSTREAMER_FFT_LIBRARIES
    GSTREAMER_GL_INCLUDE_DIRS
    GSTREAMER_GL_LIBRARIES
    GSTREAMER_INCLUDE_DIRS
    GSTREAMER_LIBRARIES
    GSTREAMER_MPEGTS_INCLUDE_DIRS
    GSTREAMER_MPEGTS_LIBRARIES
    GSTREAMER_PBUTILS_INCLUDE_DIRS
    GSTREAMER_PBUTILS_LIBRARIES
    GSTREAMER_TAG_INCLUDE_DIRS
    GSTREAMER_TAG_LIBRARIES
    GSTREAMER_VIDEO_INCLUDE_DIRS
    GSTREAMER_VIDEO_LIBRARIES
)
