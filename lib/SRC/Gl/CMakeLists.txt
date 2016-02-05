set(ARTK_ARGSUB_SRCS
./argBase.c
./argWindow.c
./argFunction.c
./argDrawMode.c
./argDraw.c
./argDrawImage.c
)

set(ARTK_ARGSUB_HEADERS
${ARTK_INCLUDE_DIR}/AR/gsub.h
${ARTK_INCLUDE_DIR}/AR/config.h
${ARTK_INCLUDE_DIR}/AR/arConfig.h
${ARTK_INCLUDE_DIR}/AR/ar.h
${ARTK_INCLUDE_DIR}/AR/matrix.h
${ARTK_INCLUDE_DIR}/AR/param.h
argPrivate.h )


set(ARTK_ARGSUB_LITE_SRCS
./gsub_lite.c
./gsub_mtx.c
)

set(ARTK_ARGSUB_LITE_HEADERS
 ${ARTK_INCLUDE_DIR}/AR/gsub_lite.h
 ${ARTK_INCLUDE_DIR}/AR/gsub_mtx.h
 ${ARTK_INCLUDE_DIR}/AR/config.h
 ${ARTK_INCLUDE_DIR}/AR/ar.h
 ${ARTK_INCLUDE_DIR}/AR/param.h
 )

add_library(ARgsub ${ARTK_ARGSUB_SRCS} ${ARTK_ARGSUB_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR})

target_link_libraries(ARgsub AR ${GLUT_LIBRARIES} ${OPENGL_LIBRARIES})

install(TARGETS ARgsub
	RUNTIME DESTINATION bin COMPONENT main			# Install the dll file in bin directory
	LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
	ARCHIVE DESTINATION lib COMPONENT main)			# Install the dll.a file in lib directory

install(FILES ${ARTK_ARGSUB_HEADERS}
	DESTINATION include/${PROJECT_NAME}
	COMPONENT main)

add_library(ARgsub_lite ${ARTK_ARGSUB_LITE_SRCS} ${ARTK_ARGSUB_LITE_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR})

target_link_libraries(ARgsub_lite AR ${GLUT_LIBRARIES} ${OPENGL_LIBRARIES})

install(TARGETS ARgsub_lite
	RUNTIME DESTINATION bin COMPONENT main			# Install the dll file in bin directory
	LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
	ARCHIVE DESTINATION lib COMPONENT main)			# Install the dll.a file in lib directory

install(FILES ${ARTK_ARGSUB_LITE_HEADERS}
	DESTINATION include/${PROJECT_NAME}
	COMPONENT main)
