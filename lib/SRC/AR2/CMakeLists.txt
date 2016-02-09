set(ARTK_AR2_SRCS
./coord.c
./handle.c
./marker.c
./searchPoint.c
./template.c
./util.c
./featureMap.c
./imageSet.c
./matching2.c
./selectTemplate.c
./tracking2d.c
./featureSet.c
./jpeg.c
./matching.c
./surface.c
./tracking.c
)

set(ARTK_AR2_HEADERS
${ARTK_INCLUDE_DIR}/AR2/config.h
${ARTK_INCLUDE_DIR}/AR2/featureSet.h
${ARTK_INCLUDE_DIR}/AR2/imageSet.h
${ARTK_INCLUDE_DIR}/AR2/tracking.h
${ARTK_INCLUDE_DIR}/AR2/searchPoint.h
${ARTK_INCLUDE_DIR}/AR2/coord.h
${ARTK_INCLUDE_DIR}/AR2/imageFormat.h
${ARTK_INCLUDE_DIR}/AR2/template.h
${ARTK_INCLUDE_DIR}/AR2/marker.h
${ARTK_INCLUDE_DIR}/AR2/util.h
)

add_library(ARTKAr2 ${ARTK_AR2_SRCS} ${ARTK_AR2_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR} )

target_link_libraries(ARTKAr2 ARTKAr ${JPEG_LIBRARIES} ARTKUtil)

install(TARGETS ARTKAr2
	RUNTIME DESTINATION bin COMPONENT main			# Install the dll file in bin directory
	LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
	ARCHIVE DESTINATION lib COMPONENT main)			# Install the dll.a file in lib directory

install(FILES ${ARTK_AR2_HEADERS}
	DESTINATION include/${PROJECT_NAME}
	COMPONENT main)
