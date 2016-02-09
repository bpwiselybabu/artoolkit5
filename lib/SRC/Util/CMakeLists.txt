set(ARTK_AR_UTILS_HEADERS
    ${ARTK_INCLUDE_DIR}/profile.h
    ${ARTK_INCLUDE_DIR}/thread_sub.h
)
    
if(WIN32)
    set(ARTK_AR_UTILS_SRCS 
        ./profile.c 
        ./thread_sub_winrt.cpp
        ./thread_sub.c
    )
    list(APPEND ARTK_AR_UTILS_HEADERS
        ./thread_sub_winrt.h
    )
    add_definitions(-DARUTIL_DISABLE_PTHREADS)
else()
    set(ARTK_AR_UTILS_SRCS 
        ./profile.c 
        ./thread_sub.c
    )
endif()

add_library(ARTKUtil ${ARTK_AR_UTILS_SRCS} ${ARTK_AR_UTILS_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR} )

install(TARGETS ARTKUtil
	RUNTIME DESTINATION bin COMPONENT main # Install the dll file in bin directory
	LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
	ARCHIVE DESTINATION lib COMPONENT main) # Install the dll.a file in lib directory

install(FILES ${ARTK_AR_UTILS_HEADERS}
	DESTINATION include/${PROJECT_NAME}
	COMPONENT main)
