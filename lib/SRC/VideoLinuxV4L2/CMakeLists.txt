set(ARTK_ARVIDEO_V4L2_HEADERS
    ${ARTK_INCLUDE_DIR}/AR/config.h
    ${ARTK_INCLUDE_DIR}/AR/video.h
    ${ARTK_INCLUDE_DIR}/AR/sys/videoLinuxV4L2.h)

set(ARTK_ARVIDEO_V4L2_SRCS
    ./videoV4L2.c)

add_library(ARTKVideoLinuxV4L2 ${ARTK_ARVIDEO_V4L2_SRCS} ${ARTK_ARVIDEO_V4L2_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR} )

target_link_libraries(ARTKVideoLinuxV4L2 ${V4L_LIBRARIES})

install(TARGETS ARTKVideoLinuxV4L2
        RUNTIME DESTINATION bin COMPONENT main			# Install the dll file in bin directory
        LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
        ARCHIVE DESTINATION lib COMPONENT main)		# Install the dll.a file in lib directory

install(FILES ${ARTK_ARVIDEO_V4L2_HEADERS}
        DESTINATION include/${PROJECT_NAME}
        COMPONENT main)
