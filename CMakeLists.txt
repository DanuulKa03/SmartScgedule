cmake_minimum_required(VERSION 3.16)
project(SmartSchedule LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick QuickControls2)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

qt_standard_project_setup(REQUIRES 6.8)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Определение исполняемого файла
qt_add_executable(${PROJECT_NAME}
        main.cpp
)

# Добавление QML директорий
list(APPEND QML_DIRS "${CMAKE_SOURCE_DIR}/qml")
list(APPEND QML_DIRS "${CMAKE_SOURCE_DIR}/qml/UILibrary")
list(REMOVE_DUPLICATES QML_DIRS)
set(QML_IMPORT_PATH "${QML_DIRS}"
        CACHE STRING "QML import paths"
        FORCE
)

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)
set(QT_QML_GENERATE_QMLLS_INI ON)

# Свойства для различных ОС
set_target_properties(${PROJECT_NAME} PROPERTIES
        WIN32_EXECUTABLE TRUE
        MACOSX_BUNDLE TRUE
        MACOSX_BUNDLE_GUI_IDENTIFIER "SmartSchedule"
)

# Связывание библиотек
target_link_libraries(${PROJECT_NAME} PRIVATE
        Qt6::Core
        Qt6::Gui
        Qt6::Qml
        Qt6::Quick
        Qt6::QuickControls2
        CommonLibplugin
        ModelsLibplugin
        PagesLibplugin
        ComponentsLibplugin
        FormsLibplugin
)

# Добавление QML модуля
qt_add_qml_module(${PROJECT_NAME}
        URI SmartSchedule
        VERSION 1.0
        QML_FILES
        src/qml/Main.qml
        src/qml/Styles/SmartScheduleStyle/Label.qml
        RESOURCES
        res/icons/right-arrow-icon.svg
        res/icons/footer/alarm-icon.svg
        res/icons/footer/calendar-icon.svg
        res/icons/footer/home-icon.svg
        res/icons/footer/setting-icon.svg
        res/fonts/Inter.ttf
        qtquickcontrols2.conf
)

# Подкаталоги для модулей
add_subdirectory(src/qml/Common)
add_subdirectory(src/qml/Models)
add_subdirectory(src/qml/Pages)
add_subdirectory(src/qml/UILibrary/Components)
add_subdirectory(src/qml/UILibrary/Forms)

# Android-специфичная конфигурация
if (ANDROID)
    # Установка архитектуры ABI
    if (NOT CMAKE_ANDROID_ARCH_ABI)
        message(WARNING "CMAKE_ANDROID_ARCH_ABI not set. Using default: arm64-v8a")
        set(CMAKE_ANDROID_ARCH_ABI "arm64-v8a")
    endif()

    message(STATUS "Building for Android ABI: ${CMAKE_ANDROID_ARCH_ABI}")

    set_target_properties(${PROJECT_NAME}
            PROPERTIES
            QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
            QT_ANDROID_TARGET_SDK_VERSION "33"
            QT_ANDROID_MIN_SDK_VERSION "21"
    )

    # Дополнительные параметры для сборки
    set(ANDROID_NATIVE_LIB_DIRECTORIES "${CMAKE_BINARY_DIR}/lib/${CMAKE_ANDROID_ARCH_ABI}")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib/${CMAKE_ANDROID_ARCH_ABI}")
endif()

# Генерация скрипта для развертывания
qt_generate_deploy_qml_app_script(
        TARGET ${PROJECT_NAME}
        FILENAME_VARIABLE deploy_script
        MACOS_BUNDLE_POST_BUILD
        NO_UNSUPPORTED_PLATFORM_ERROR
        DEPLOY_USER_QML_MODULES_ON_UNSUPPORTED_PLATFORM
)
install(SCRIPT ${deploy_script})
