cmake_minimum_required(VERSION 3.16)

project(SVET VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC on)
set(CMAKE_AUTORCC on)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appSVET
    main.cpp
    Images.qrc
)

qt_add_qml_module(appSVET
    URI SVET
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES Page_red.qml
        QML_FILES Page_green.qml
        QML_FILES Page_yellow.qml
        QML_FILES Page_start.qml

)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appSVET PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appSVET
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appSVET
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appSVET
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
