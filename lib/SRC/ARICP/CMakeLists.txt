set(ARTK_ARICP_SRCS
./icpCalibStereo.c
./icpHandle.c
./icpPointRobust.c
./icpStereoPoint.c
./icpUtil.c
./icpCore.c
./icpPoint.c
./icpStereoHandle.c
./icpStereoPointRobust.c
)
set(ARTK_ARICP_HEADERS
${ARTK_INCLUDE_DIR}/AR/config.h
${ARTK_INCLUDE_DIR}/AR/matrix.h
${ARTK_INCLUDE_DIR}/AR/param.h
${ARTK_INCLUDE_DIR}/AR/arConfig.h
${ARTK_INCLUDE_DIR}/AR/ar.h
${ARTK_INCLUDE_DIR}/AR/icp.h
${ARTK_INCLUDE_DIR}/AR/icpCore.h
${ARTK_INCLUDE_DIR}/AR/icpCalib.h
)

add_library(ARIcp ${ARTK_ARICP_SRCS} ${ARTK_ARICP_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR} )

#target_link_libraries(ARIcp ${GSTREAMER_LIBRARIES})

install(TARGETS ARIcp
	RUNTIME DESTINATION bin COMPONENT main			# Install the dll file in bin directory
	LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
	ARCHIVE DESTINATION lib COMPONENT main)			# Install the dll.a file in lib directory

install(FILES ${hdrs}
	DESTINATION include/${PROJECT_NAME}
	COMPONENT main)
