set(ARTK_AR_VIDEO_SRCS
./video.c
./video2.c
./videoAspectRatio.c
./videoSaveImage.c
)

set(ARTK_AR_VIDEO_HEADERS
${ARTK_INCLUDE_DIR}/AR/config.h
${ARTK_INCLUDE_DIR}/AR/arConfig.h
${ARTK_INCLUDE_DIR}/AR/ar.h
${ARTK_INCLUDE_DIR}/AR/videoConfig.h
${ARTK_INCLUDE_DIR}/AR/video.h
${ARTK_INCLUDE_DIR}/AR/sys/videoDummy.h
${ARTK_INCLUDE_DIR}/AR/sys/videoImage.h
)

set(ARTK_AR_DUMMY_VIDEO_SRCS
../VideoDummy/videoDummy.c
)


set(ARTK_AR_IMAGE_VIDEO_SRCS
../VideoImage/videoImage.c
)



add_library(ARTKVideo ${ARTK_AR_VIDEO_SRCS} ${ARTK_AR_DUMMY_VIDEO_SRCS} ${ARTK_AR_IMAGE_VIDEO_SRCS} ${ARTK_AR_VIDEO_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR} ${ARTK_INCLUDE_DIR}/ios511/ )

target_link_libraries(ARTKVideo ${VIDEO_BACKEND_LIBS} ${JPEG_LIBRARIES})

install(TARGETS ARTKVideo
	RUNTIME DESTINATION bin COMPONENT main			# Install the dll file in bin directory
	LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
	ARCHIVE DESTINATION lib COMPONENT main)		# Install the dll.a file in lib directory

install(FILES ${ARTK_AR_VIDEO_HEADERS}
	DESTINATION include/${PROJECT_NAME}
	COMPONENT main)
