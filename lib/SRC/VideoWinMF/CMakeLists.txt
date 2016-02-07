set(ARTK_VIDEOWINMF_SRCS
    ./LogMediaType.cpp
    ./videoWinMF.cpp
)

set(ARTK_VIDEOWINMF_HEADERS
    ${ARTK_INCLUDE_DIR}/AR/config.h
    ${ARTK_INCLUDE_DIR}/AR/video.h
    ${ARTK_INCLUDE_DIR}/AR/sys/videoWindowsMediaFoundation.h
    ./BufferLock.h
)

add_library(MediaFondation STATIC ${ARTK_VIDEOWINMF_SRCS} ${ARTK_VIDEOWINMF_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR} )

target_link_libraries(MediaFondation AR)

install(TARGETS MediaFondation
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION lib
	ARCHIVE DESTINATION lib )

install(FILES ${ARTK_VIDEOWINMF_HEADERS}
	DESTINATION include/${PROJECT_NAME}
	COMPONENT main)
