
  add_executable(simpleLite simpleLite.c)
  include_directories( ${ARTK_INCLUDE_DIR} )

  target_link_libraries(simpleLite AR ARIcp ARUtil ARgsub_lite ARVideo ${OPENGL_LIBRARIES} ${GLUT_LIBRARIES})

  install(TARGETS simpleLite RUNTIME DESTINATION bin)
