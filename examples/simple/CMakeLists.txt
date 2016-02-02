
  add_executable(simple simpleTest.c)
  include_directories( ${ARTK_INCLUDE_DIR} )

  #message("Links to : AR ${ARIcp} ${ARUtil} ${ARgsub} ${ARVideo} ${OPENGL_LIBRARIES} ${GLUT_LIBRARIES}")
  target_link_libraries(simple AR ARIcp ARUtil ARgsub ARVideo ${OPENGL_LIBRARIES} ${GLUT_LIBRARIES})

  install(TARGETS simple RUNTIME DESTINATION bin)
