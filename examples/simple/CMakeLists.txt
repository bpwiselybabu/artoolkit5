
  add_executable(simple simpleTest.c)
  include_directories( ${ARTK_INCLUDE_DIR} )

  target_link_libraries(simple ARTKAr ARTKIcp ARTKUtil ARTKgsub ARTKVideo ${OPENGL_LIBRARIES} ${GLUT_LIBRARIES})

  install(TARGETS simple RUNTIME DESTINATION bin)
