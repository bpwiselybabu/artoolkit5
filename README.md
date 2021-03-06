Read me for ARToolKit.
======================


Contents.
---------

About this archive.

Build with CMake.

Running the examples.

Beginning your own development.

Release notes.

libKPM usage.

Next steps.


About this archive.
-------------------

This archive contains the ARToolKit libraries, utilities and examples, version 5.3.1.

ARToolKit version 5.3.1 is released under the GNU Lesser General Public License version 3, with some additional permissions. Example code is generally released under a more permissive disclaimer; please read the file LICENSE.txt for more information.

ARToolKit is designed to build on Windows, Macintosh OS X, Linux, iOS and Android platforms.

This archive was assembled by:
    Philip Lamb
    http://www.artoolkit.org
    2015-10-05


Build with CMake. [![Build Status](https://travis-ci.org/schweitzer/artoolkit5.svg?branch=cmake_build)](https://travis-ci.org/schweitzer/artoolkit5)
----------

This Version of ARToolkit is an experimental version based on cmake :

You need to install the latest version of cmake (>=3.4.1)

To configure the project :
* Create a *'build'* and a *'install'* folders outside of the sources
* Open a terminal and go inside your *'build'* directory and launch *'ccmake'* or *'cmake-gui'*

like this : ```$ cmake ./path/to/the/sources ```
* Fill out the differents options asked by cmake
* do *'configure'* then *'generate'*
* the do a *'make install'* to build and install the ARToolkit libraries

The build was tested on Linux, OSX and Windows.

No support for mobile platform was performed.

** This work is still on progress, it may change rapidly. **

Running the examples
--------------------

ARToolKit includes a variety of examples demonstrating ARToolKit programming techniques. After installation, the executables for these applications can be found in the bin directory inside your ARToolKit directory.
The simpleLite example is the most straightforward example. It can be run to test your ARToolKit installation is functioning correctly.

An explanation of the sourcecode of this example can be found on the page http://www.artoolkit.org/documentation/Examples:example_simplelite. More detailed information about the techniques demonstrated in each example can be found in the documentation.

 * Windows:

    simpleLite can be opened by double-clicking its icon in the ARToolKit5\bin directory. Alternately, you can run it from the command line:

    * Open a command-line window (cmd.exe).
    * Navigate to your ARToolKit5\bin directory.
    * Type: simpleLite.exe


  * Mac OS X:

	* Bundled applications are generated for the examples. Open the "bin" directory in the Finder and double-click the "simpleLite" example app. Application errors are logged in the Console application.

  * Linux:

	* simpleLite can be launched from a terminal window thus:
	  First, set the environment variable ARTOOLKIT5_VCONF to indicate the video device to be used;
	  for example, to use a V4L2 camera, do
	    export ARTOOLKIT5_VCONF="-device=LinuxV4L2"

	    or to use a camera driven via GStreamer, do

	    export ARTOOLKIT5_VCONF="-device=GStreamer"

	    then cd to the bin directory and do

		./simpleLite


Beginning your own development
------------------------------

In beginning your own development, it is recommended that you create your own project outside the ARToolKit folder, and treat ARToolKit as an external SDK. However, it is also perfectly permissible to begin by modifying one or more of the example applications. ARToolKit is supplied with project files for each supported platform. The project files allow you to rebuild ARToolKit from source, and act as examples of how to structure your own application builds (e.g. required link libraries).

Required external software

  * A supported compiler or IDE is required to use ARToolKit:

	Windows: Microsoft Visual Studio 2013 and Microsoft Visual Studio 2010 SP1 are supported. The free Microsoft Visual Studio Express Edition will also work.
	Mac OS X: Xcode tools v5.1 under Mac OS X 10.9 or later is required. Xcode 6 under Mac OS X 10.10 is recommended. Xcode may be obtained free from Apple at http://developer.apple.com/xcode/.
    Linux: g++ with libstdc++, or Clang and LLVM's libc++ are required. For the latter, install Packages: 'clang', 'libc++-dev'.

  Where ARToolKit libraries require external DLLs, these are generally supplied with ARToolKit. Exceptions are listed below.

  Windows
    * OpenGL version 1.5 or later is required. This is usually provided by the display drivers, as the base system supports only OpenGL v1.4.
	The optional video capture sources require some external software:
	* QuickTime movie files as video source: QuickTime 6.4 or later must be installed. Download from http://www.apple.com/quicktime/download/.
	* Point Grey camera: The Flycapture SDK (distributed with Point Grey Cameras) must be installed.

  Mac OS X
    * C++ runtime: libc++ is only available on OS X 10.7 and later.
	* OpenSceneGraph (optional; The ARToolKit OSG renderer requires OpenSceneGraph). Use the installer provided at http://www.artoolkit.org/dist/openscenegraph/.

  Linux
	ARToolKit follows the Linux model whereby required software is externally installed. The following packages are required to be installed in your package manager to run the ARToolKit examples. (Additional packages required to build ARToolKit from source are listed on that help page.)
    * C++ runtime: use the standard libstdc++ or install the package 'libc++1'.
	* OpenGL: Package 'xorg'
	* OpenCV (unless building with Clang). Packages: 'libopencv-dev'.
	* GLUT: Package 'freeglut3'. Alternatively, GLUT can be built from source and is also included in the MESA 3D libraries:
	* Video4Linux, lib1394dc, or GStreamer. Packages: 'libv4l2-0', 'libdc1394-22' (for lib1394 version 2.x) or 'libdc1394-13' (for lib1394 version 1.x), and 'libgstreamer0.10'.
	* OpenSceneGraph (optional; The ARToolKit OSG renderer requires OpenSceneGraph). Package 'openscenegraph'.
	* OpenVRML (optional; the ARToolKit VRML renderer requires OpenVRML): Binary deb packages are available from http://www.openvrml.org/.


Release notes.
--------------

This release contains ARToolKit v5.3.1.

The major change in ARToolKit v5.3 was a new version of libKPM based on the FREAK detector framework, contributed by DAQRI. See "libKPM usage" below.

Please see the ChangeLog.txt for details of changes in this and earlier releases.

ARToolKit v5.2 was the first major release under an open source license in several years, and represented several years of commercial development of ARToolKit by ARToolworks during this time. It was a significant change to previous users of ARToolKit v2.x. Please see http://www.artoolkit.org/documentation/ARToolKit_feature_comparison for more information.

For users of ARToolKit Professional versions 4.0 through 5.1.7, ARToolKit v5.2 and later include a number of changes. Significantly, full source is now provided for the NFT libraries libAR2 and libKPM.


libKPM usage.
-------------

libKPM, which performs key-point matching for NFT page recognition and initialization now use a FREAK detector framework, contributed by DAQRI. Unlike the previous commercial version of libKPM which used SURF features, FREAK is not encumbered by patents. libKPM now joins the other core ARToolKit libraries under an LGPLv3 license. Additionally the new libKPM no longer has dependencies on OpenCV’s FLANN library, which should simply app builds and distribution on all supported platforms.

Existing holders of a commercial license to ARToolKit Professional v5.x may use libKPM from ARToolKit v5.2 under the terms of their current license for the remainder of its duration. Please contact us via http://www.artoolkit.org/contact if you are an existing user of ARToolKit Professional with questions.


Next steps.
-----------

We have made a forum for discussion of ARToolKit for Desktop development available on our community website.

http://www.artoolkit.org/community/forums/viewforum.php?f=29

You are invited to join the forum and contribute your questions, answers and success stories.

ARToolKit consists of a full ecosystem of SDKs for desktop, web, mobile and in-app plugin augmented reality. Stay up to date with information and releases from artoolkit.org by joining our announcements mailing list.

http://www.artoolkit.org/community/lists/


Do you have a feature request, bug report, or other code you would like to contribute to ARToolKit? Access the complete source and issue tracker for ARToolKit at http://github.com/artoolkit/artoolkit5
