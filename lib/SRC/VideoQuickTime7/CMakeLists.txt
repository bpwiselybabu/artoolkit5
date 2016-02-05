set(ARTK_VIDEOQUICKTIME7_SRCS
./QTKitVideo.m
./videoQuickTime7.m
)

set(ARTK_VIDEOQUICKTIME7_HEADERS
${ARTK_INCLUDE_DIR}/AR/config.h
${ARTK_INCLUDE_DIR}/AR/video.h
${ARTK_INCLUDE_DIR}/AR/sys/videoQuickTime7.h
./QTKitVideo.h
./videoQuickTime7QTKitVideoGotFrameDelegate.h
)

add_library(ARVideoQuickTime7 ${ARTK_VIDEOQUICKTIME7_SRCS} ${ARTK_VIDEOQUICKTIME7_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR} )

target_link_libraries(ARVideoQuickTime7  AR "-framework QTKit" "-framework CoreFoundation"
"-framework QuartzCore" "-framework Foundation" "-framework Cocoa" "-framework QTKit" "-framework AppKit")

install(TARGETS ARVideoQuickTime7
	RUNTIME DESTINATION bin COMPONENT main # Install the dll file in bin directory
	LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
	ARCHIVE DESTINATION lib COMPONENT main) # Install the dll.a file in lib directory

install(FILES ${ARTK_VIDEOQUICKTIME7_HEADERS}
	DESTINATION include/${PROJECT_NAME}
	COMPONENT main)
