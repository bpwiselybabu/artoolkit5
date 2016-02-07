set(ARTK_VIDEOWINDS_SRCS
    ./videoWinDS.cpp
)

set(ARTK_VIDEOWINDS_HEADERS
    ${ARTK_INCLUDE_DIR}/AR/config.h
    ${ARTK_INCLUDE_DIR}/AR/video.h
    ${ARTK_INCLUDE_DIR}/AR/sys/videoWindowsDirectShow.h
    ./videoWinDSPrivate.h
)

add_library(DirectShow STATIC ${ARTK_VIDEOWINDS_SRCS} ${ARTK_VIDEOWINDS_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR} )
set(CMAKE_INCLUDE_CURRENT_DIR ON)

target_link_libraries(DirectShow AR)

install(TARGETS DirectShow
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION lib
	ARCHIVE DESTINATION lib )

install(FILES ${ARTK_VIDEOWINDS_HEADERS}
	DESTINATION include/${PROJECT_NAME}
	COMPONENT main)
