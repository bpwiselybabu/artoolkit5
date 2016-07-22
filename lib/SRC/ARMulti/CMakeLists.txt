set(ARTK_ARMULTI_HEADERS
${ARTK_INCLUDE_DIR}/AR/config.h
${ARTK_INCLUDE_DIR}/AR/arConfig.h
${ARTK_INCLUDE_DIR}/AR/matrix.h
${ARTK_INCLUDE_DIR}/AR/param.h
${ARTK_INCLUDE_DIR}/AR/ar.h
${ARTK_INCLUDE_DIR}/AR/arMulti.h
)
set(ARTK_ARMULTI_SRCS
    ./arMultiReadConfigFile.c
    ./arMultiFreeConfig.c
    ./arMultiGetTransMat.c
    ./arMultiGetTransMatStereo.c
)
add_library(ARTKMulti ${ARTK_ARMULTI_SRCS} ${ARTK_ARMULTI_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR} )

target_link_libraries(ARTKMulti ARTKAr)

install(TARGETS ARTKMulti
	RUNTIME DESTINATION bin COMPONENT main			# Install the dll file in bin directory
	LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
	ARCHIVE DESTINATION lib COMPONENT main)			# Install the dll.a file in lib directory

install(FILES ${ARTK_ARMULTI_HEADERS}
	DESTINATION include/AR
	COMPONENT main)
