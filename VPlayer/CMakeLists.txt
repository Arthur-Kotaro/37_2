cmake_minimum_required(VERSION 3.16)

project(VPlayer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_PREFIX_PATH "F:\\Qt\\6.9.3\\mingw_64\\lib\\cmake")
#find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets Quick)

qt_add_executable(appVPlayer main.cpp)

qt_add_qml_module(appVPlayer
    URI VPlayer VERSION 1.0 QML_FILES
        Main.qml
        RESOURCES resources/pic_var_01.png
        RESOURCES build/Desktop_Qt_6_9_3_MinGW_64_bit-Debug/VPlayer/resources/pic_var_01.png
        RESOURCES resources/Buttons/audio.png resources/Buttons/Back.png resources/Buttons/Begin.png resources/Buttons/End.png resources/Buttons/Forward.png resources/Buttons/Pause.png resources/Buttons/Play.png resources/Buttons/play-in-circle.png resources/Buttons/Repeat.png resources/Buttons/Stop.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appVPlayer PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appVPlayer
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

#target_link_libraries(appVPlayer PRIVATE Qt6::Quick)

target_link_libraries(appVPlayer PRIVATE Qt::Core Qt::Gui Qt::Widgets Qt6::Quick)
include(GNUInstallDirs)
install(TARGETS appVPlayer BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
