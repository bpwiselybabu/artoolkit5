
set(ARTK_AR_SRCS
./ar3DCreateHandle.c
./paramDecomp.c
./paramLT.c
./arGetMarkerInfo.c
./arGetTransMat.c
./arImageProc.c
./arPattGetID.c
./arDetectMarker2.c
./arGetTransMatStereo.c
./arLabelingSub/arLabelingSubDWRC.c
./arLabelingSub/arLabelingSubEBRC.c
./arLabelingSub/arLabelingSubEWZ.c
./arLabelingSub/arLabelingSubEWI3C565.c
./arLabelingSub/arLabelingSubDWR3C565.c
./arLabelingSub/arLabelingSubDBRCY.c
./arLabelingSub/arLabelingSubEWI3CA4444.c
./arLabelingSub/arLabelingSubEBI3CA.c
./arLabelingSub/arLabelingSubDBZ.c
./arLabelingSub/arLabelingSubEWR3CA5551.c
./arLabelingSub/arLabelingSubDBR3CA5551.c
./arLabelingSub/arLabelingSubEWIA3C.c
./arLabelingSub/arLabelingSubDWI3CA.c
./arLabelingSub/arLabelingSubEBRA3C.c
./arLabelingSub/arLabelingSubEBI3C565.c
./arLabelingSub/arLabelingSubDWR3CA5551.c
./arLabelingSub/arLabelingSubDBIYC.c
./arLabelingSub/arLabelingSubEWRYC.c
./arLabelingSub/arLabelingSubDBR3C565.c
./arLabelingSub/arLabelingSubEBR3CA5551.c
./arLabelingSub/arLabelingSubEWR3C565.c
./arLabelingSub/arLabelingSubDBI3CA4444.c
./arLabelingSub/arLabelingSubEWI3CA.c
./arLabelingSub/arLabelingSubDBRA3C.c
./arLabelingSub/arLabelingSubEWIYC.c
./arLabelingSub/arLabelingSubDWI3CA4444.c
./arLabelingSub/arLabelingSubDWIC.c
./arLabelingSub/arLabelingSubEWR3CA4444.c
./arLabelingSub/arLabelingSubEWICY.c
./arLabelingSub/arLabelingSubEBR3CA.c
./arLabelingSub/arLabelingSubDWR3CA.c
./arLabelingSub/arLabelingSubDWIA3C.c
./arLabelingSub/arLabelingSubDBIA3C.c
./arLabelingSub/arLabelingSubDWZ.c
./arLabelingSub/arLabelingSubEBI3C.c
./arLabelingSub/arLabelingSubEWR3C.c
./arLabelingSub/arLabelingSubEWI3CA5551.c
./arLabelingSub/arLabelingSubDBICY.c
./arLabelingSub/arLabelingSubEWRCY.c
./arLabelingSub/arLabelingSubEBIC.c
./arLabelingSub/arLabelingSubDWR3C.c
./arLabelingSub/arLabelingSubEBIYC.c
./arLabelingSub/arLabelingSubDBI3CA5551.c
./arLabelingSub/arLabelingSubDBR3C.c
./arLabelingSub/arLabelingSubDBIC.c
./arLabelingSub/arLabelingSubEWR3CA.c
./arLabelingSub/arLabelingSubEWRA3C.c
./arLabelingSub/arLabelingSubDWRA3C.c
./arLabelingSub/arLabelingSubEBIA3C.c
./arLabelingSub/arLabelingSubEWIC.c
./arLabelingSub/arLabelingSubDWR3CA4444.c
./arLabelingSub/arLabelingSubEBR3C565.c
./arLabelingSub/arLabelingSubDBR3CA.c
./arLabelingSub/arLabelingSubEBR3CA4444.c
./arLabelingSub/arLabelingSubDBI3CA.c
./arLabelingSub/arLabelingSubDWRYC.c
./arLabelingSub/arLabelingSubDBI3C.c
./arLabelingSub/arLabelingSubDBI3C565.c
./arLabelingSub/arLabelingSubEBRYC.c
./arLabelingSub/arLabelingSubDBRC.c
./arLabelingSub/arLabelingSubEWRC.c
./arLabelingSub/arLabelingSubDWI3C.c
./arLabelingSub/arLabelingSubEBICY.c
./arLabelingSub/arLabelingSubDBR3CA4444.c
./arLabelingSub/arLabelingSubDWICY.c
./arLabelingSub/arLabelingSubEBI3CA4444.c
./arLabelingSub/arLabelingSubDWIYC.c
./arLabelingSub/arLabelingSubDBRYC.c
./arLabelingSub/arLabelingSubDWI3CA5551.c
./arLabelingSub/arLabelingSubDWRCY.c
./arLabelingSub/arLabelingSubEBR3C.c
./arLabelingSub/arLabelingSubDWI3C565.c
./arLabelingSub/arLabelingSubEBRCY.c
./arLabelingSub/arLabelingSubEBI3CA5551.c
./arLabelingSub/arLabelingSubEWI3C.c
./arLabelingSub/arLabelingSubEBZ.c
./ar3DUtil.c
./arLabeling.c
./arCreateHandle.c
./paramDisp.c
./arPattLoad.c
./arPattSave.c
./arGetLine.c
./paramGetPerspective.c
./arFilterTransMat.c
./arPattAttach.c
./paramChangeSize.c
./arPattCreateHandle.c
./paramDistortion.c
./paramClear.c
./paramFile.c
./arDetectMarker.c
)

set(ARTK_AR_HEADERS
${ARTK_INCLUDE_DIR}/AR/gsub_es2.h
${ARTK_INCLUDE_DIR}/AR/gsub_es.h
${ARTK_INCLUDE_DIR}/AR/videoConfig.h
${ARTK_INCLUDE_DIR}/AR/matrix.h
${ARTK_INCLUDE_DIR}/AR/gsub_mtx.h
${ARTK_INCLUDE_DIR}/AR/arImageProc.h
${ARTK_INCLUDE_DIR}/AR/arosg.h
${ARTK_INCLUDE_DIR}/AR/arConfig.h
${ARTK_INCLUDE_DIR}/AR/gsub_lite.h
${ARTK_INCLUDE_DIR}/AR/gsubConfig.h
${ARTK_INCLUDE_DIR}/AR/ar.h
${ARTK_INCLUDE_DIR}/AR/video.h
${ARTK_INCLUDE_DIR}/AR/gsub.h
${ARTK_INCLUDE_DIR}/AR/sys/videoWindowsDirectShow.h
${ARTK_INCLUDE_DIR}/AR/sys/videoLinux1394Cam.h
${ARTK_INCLUDE_DIR}/AR/sys/MovieVideo.h
${ARTK_INCLUDE_DIR}/AR/sys/videoWindowsDSVideoLib.h
${ARTK_INCLUDE_DIR}/AR/sys/videoLinuxV4L2.h
${ARTK_INCLUDE_DIR}/AR/sys/videoiPhone.h
${ARTK_INCLUDE_DIR}/AR/sys/CameraVideo.h
${ARTK_INCLUDE_DIR}/AR/sys/videoQuickTimeMovie.h
${ARTK_INCLUDE_DIR}/AR/sys/videoGStreamer.h
${ARTK_INCLUDE_DIR}/AR/sys/videoLinuxV4L.h
${ARTK_INCLUDE_DIR}/AR/sys/videoLinux1394CamV1.h
${ARTK_INCLUDE_DIR}/AR/sys/videoImage.h
${ARTK_INCLUDE_DIR}/AR/sys/videoWindowsMediaFoundation.h
${ARTK_INCLUDE_DIR}/AR/sys/WindowsMediaCapture.h
${ARTK_INCLUDE_DIR}/AR/sys/videoDummy.h
${ARTK_INCLUDE_DIR}/AR/sys/videoQuickTime7.h
${ARTK_INCLUDE_DIR}/AR/sys/videoQuickTime.h
${ARTK_INCLUDE_DIR}/AR/sys/videoAndroid.h
${ARTK_INCLUDE_DIR}/AR/sys/videoWindowsMediaCapture.h
${ARTK_INCLUDE_DIR}/AR/sys/videoWindowsDragonFly.h
${ARTK_INCLUDE_DIR}/AR/sys/videoLinux1394CamV2.h
${ARTK_INCLUDE_DIR}/AR/arFilterTransMat.h
${ARTK_INCLUDE_DIR}/AR/arvrml.h
${ARTK_INCLUDE_DIR}/AR/arMulti.h
${ARTK_INCLUDE_DIR}/AR/param.h)


add_library(ARTKAr ${ARTK_AR_SRCS} ${ARTK_AR_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR})

target_link_libraries(ARTKAr ARTKCore ARTKIcp ${OpenCV_LIBS})

if(APPLE)
    target_link_libraries(ARTKAr "-framework CoreFoundation" "-framework Accelerate")
endif()

install(TARGETS ARTKAr
	RUNTIME DESTINATION bin COMPONENT main			# Install the dll file in bin directory
	LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
	ARCHIVE DESTINATION lib COMPONENT main)			# Install the dll.a file in lib directory

install(FILES ${ARTK_AR_HEADERS}
	DESTINATION include/${PROJECT_NAME}
	COMPONENT main)
