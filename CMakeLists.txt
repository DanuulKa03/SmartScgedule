cmake_minimum_required(VERSION 3.16)
project(calqlatr LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick QuickControls2)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

qt_standard_project_setup(REQUIRES 6.5)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

qt_add_executable(${PROJECT_NAME} WIN32 MACOSX_BUNDLE
        main.cpp
)

# Register QML import paths for code completion
list(APPEND QML_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/src/qml/Common")
list(APPEND QML_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/src/qml/Pages")
list(APPEND QML_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/src/qml/UILibrary/Components")
list(APPEND QML_DIRS "${CMAKE_CURRENT_SOURCE_DIR}/src/qml/UILibrary/Forms")
list(REMOVE_DUPLICATES QML_DIRS)
set(QML_IMPORT_PATH "${QML_DIRS}" CACHE STRING "QML import paths" FORCE)

target_link_libraries(${PROJECT_NAME} PRIVATE
        Qt6::Core
        Qt6::Gui
        Qt6::Qml
        Qt6::Quick
        Qt6::QuickControls2
        CommonLibplugin
        PagesLibplugin
        ComponentsLibplugin
        FormsLibplugin
)

qt_add_qml_module(${PROJECT_NAME}
        URI demos.calqlatr
        VERSION 1.0
        QML_FILES src/qml/Main.qml
)

add_subdirectory(src/qml/Common)
add_subdirectory(src/qml/Pages)
add_subdirectory(src/qml/UILibrary/Components)
add_subdirectory(src/qml/UILibrary/Forms)

if (ANDROID)
    set_target_properties(${PROJECT_NAME}
            PROPERTIES
            QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
            QT_ANDROID_TARGET_SDK_VERSION "33")
endif ()

install(TARGETS ${PROJECT_NAME}
        BUNDLE DESTINATION .
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

qt_generate_deploy_qml_app_script(
        TARGET ${PROJECT_NAME}
        FILENAME_VARIABLE deploy_script
        MACOS_BUNDLE_POST_BUILD
        NO_UNSUPPORTED_PLATFORM_ERROR
        DEPLOY_USER_QML_MODULES_ON_UNSUPPORTED_PLATFORM
)
install(SCRIPT ${deploy_script})
