set(ARTK_ARCORE_SRCS
./mAlloc.c
./mAllocDup.c
./mAllocInv.c
./mAllocMul.c
./mAllocTrans.c
./mAllocUnit.c
./mDet.c
./mDisp.c
./mDup.c
./mFree.c
./mInv.c
./mMul.c
./mPCA.c
./mSelfInv.c
./mTrans.c
./mUnit.c
./vAlloc.c
./vTridiag.c
./vFree.c
./vDisp.c
./vInnerP.c
./vHouse.c
./arUtil.c

)
set(ARTK_ARCORE_HEADERS
${ARTK_INCLUDE_DIR}/AR/ar.h
${ARTK_INCLUDE_DIR}/AR/matrix.h
)


add_library(ARCore ${ARTK_ARCORE_SRCS} ${ARTK_ARCORE_HEADERS})
include_directories( ${ARTK_INCLUDE_DIR})

if(APPLE)
    target_link_libraries(ARCore "-framework CoreFoundation")
endif()



install(TARGETS ARCore
        RUNTIME DESTINATION bin COMPONENT main			# Install the dll file in bin directory
        LIBRARY DESTINATION lib PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE COMPONENT main
        ARCHIVE DESTINATION lib COMPONENT main)			# Install the dll.a file in lib directory

install(FILES ${ARTK_ARCORE_HEADERS}
        DESTINATION include/${PROJECT_NAME}
        COMPONENT main)
