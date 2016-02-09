if(BUILD_EXAMPLES)
    add_subdirectory(./simple)
    add_subdirectory(./simpleLite)

    #install datas for examples
    install(DIRECTORY ${CMAKE_SOURCE_DIR}/bin
            DESTINATION ./
            COMPONENT main)
endif()
