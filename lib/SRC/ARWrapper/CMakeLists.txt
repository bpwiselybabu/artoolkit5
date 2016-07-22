set(ARTK_WRAPPER_HEADERS
./trackingSub.h
${ARTK_INCLUDE_DIR}/ARWrapper/AndroidFeatures.h
${ARTK_INCLUDE_DIR}/ARWrapper/AndroidVideoSource.h
${ARTK_INCLUDE_DIR}/ARWrapper/ARController.h
${ARTK_INCLUDE_DIR}/ARWrapper/ARMarker.h
${ARTK_INCLUDE_DIR}/ARWrapper/ARMarkerMulti.h
${ARTK_INCLUDE_DIR}/ARWrapper/ARMarkerNFT.h
${ARTK_INCLUDE_DIR}/ARWrapper/ARMarkerSquare.h
${ARTK_INCLUDE_DIR}/ARWrapper/ARPattern.h
${ARTK_INCLUDE_DIR}/ARWrapper/ARToolKitVideoSource.h
${ARTK_INCLUDE_DIR}/ARWrapper/ARToolKitWrapperExportedAPI.h
${ARTK_INCLUDE_DIR}/ARWrapper/ColorConversion.h
${ARTK_INCLUDE_DIR}/ARWrapper/Error.h
${ARTK_INCLUDE_DIR}/ARWrapper/Image.h
${ARTK_INCLUDE_DIR}/ARWrapper/Platform.h
${ARTK_INCLUDE_DIR}/ARWrapper/VideoSource.h

)
set(ARTK_WRAPPER_SRCS
    AndroidFeatures.cpp
    AndroidVideoSource.cpp
    ARController.cpp
    ARMarker.cpp
    ARMarkerMulti.cpp
    ARMarkerNFT.cpp
    ARMarkerSquare.cpp
    ARPattern.cpp
    ARToolKitVideoSource.cpp
    ARToolKitWrapperExportedAPI.cpp
    ColorConversion.cpp
    trackingSub.c
    VideoSource.cpp
)

add_library(ARTKWrapper ${ARTK_WRAPPER_SRCS} ${ARTK_WRAPPER_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR} )

target_link_libraries(ARTKWrapper ARTKAr ARTKAr2 ARTKIcp ARTKMulti ARTKVideo ARTKCore ARTKUtil ARTKgsub_lite)

install(TARGETS ARTKWrapper
	RUNTIME DESTINATION bin COMPONENT main			# Install the dll file in bin directory
	LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
	ARCHIVE DESTINATION lib COMPONENT main)			# Install the dll.a file in lib directory

install(FILES ${ARTK_WRAPPER_HEADERS}
	DESTINATION include/ARWrapper
	COMPONENT main)
