# - Test for DirectShow on Windows.
# Once loaded this will define
#   DIRECTSHOW_FOUND        - system has DirectShow
#   DIRECTSHOW_INCLUDE_DIR  - include directory for DirectShow
#   DIRECTSHOW_LIBRARIES    - libraries you need to link to

set(DIRECTSHOW_FOUND "NO")

# DirectShow is only available on Windows platforms
if(WIN32)
  # Find DirectX Include Directory
  find_path(DIRECTX_INCLUDE_DIR ddraw.h
    "C:/Program Files/Microsoft Visual Studio .NET 2003/Vc7/PlatformSDK/Include"
    "C:/Program Files/Microsoft DirectX SDK (February 2006)/Include"
    "C:/Program Files/Microsoft DirectX 9.0 SDK (June 2005)/Include"
    "C:/DXSDK/Include"
    DOC "What is the path where the file ddraw.h can be found"
  )

  # if DirectX found, then find DirectShow include directory
  if(DIRECTX_INCLUDE_DIR)
    find_path(DIRECTSHOW_INCLUDE_DIR dshow.h
      "C:/Program Files/Microsoft Visual Studio .NET 2003/Vc7/PlatformSDK/Include"
      "C:/Program Files/Microsoft Platform SDK/Include"
      "C:/DXSDK/Include"
      DOC "What is the path where the file dshow.h can be found"
    )

    # if DirectShow include dir found, then find DirectShow libraries
    if(DIRECTSHOW_INCLUDE_DIR)
      find_library(DIRECTSHOW_strmiids_LIBRARY strmiids
        "C:/Program Files/Microsoft Visual Studio .NET 2003/Vc7/PlatformSDK/Lib"
        "C:/Program Files/Microsoft Platform SDK/Lib"
        "C:/DXSDK/Include/Lib"
        DOC "Where can the DirectShow strmiids library be found"
      )
      find_library(DIRECTSHOW_quartz_LIBRARY quartz
        "C:/Program Files/Microsoft Visual Studio .NET 2003/Vc7/PlatformSDK/Lib"
        "C:/Program Files/Microsoft Platform SDK/Lib"
        "C:/DXSDK/Include/Lib"
        DOC "Where can the DirectShow quartz library be found"
      )

      # if DirectShow libraries found, then we're ok
      if(DIRECTSHOW_strmiids_LIBRARY)
        if(DIRECTSHOW_quartz_LIBRARY)
          # everything found
          set(DIRECTSHOW_FOUND "YES")
        endif()
      endif()
      
    endif()
  endif()
endif()

#---------------------------------------------------------------------

if(DIRECTSHOW_FOUND)
  set(DIRECTSHOW_INCLUDE_DIR
    ${DIRECTSHOW_INCLUDE_DIR}
    ${DIRECTX_INCLUDE_DIR}
  )

  set(DIRECTSHOW_LIBRARIES
    ${DIRECTSHOW_strmiids_LIBRARY}
    ${DIRECTSHOW_quartz_LIBRARY}
  )
else()
  # make FIND_PACKAGE friendly
  if(NOT DIRECTSHOW_FIND_QUIETLY)
    
    if(DIRECTSHOW_FIND_REQUIRED)
      message(FATAL_ERROR
              "DirectShow required, please specify it's location.")
    else()
      message(STATUS "DirectShow was not found.")
    endif()
    
  endif()
endif()
