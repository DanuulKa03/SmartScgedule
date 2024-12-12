# Добавление новых модулей.

1. Создать `CMakeLists.txt` внутри модуля, который хотите создать.
2. Разместить в этот файл такое
```cmake
qt_add_library(<URI модуля>Lib STATIC)

set_target_properties(<URI модуля>Lib PROPERTIES AUTOMOC ON)
# Добавить либы, которые используются в модуле.
target_link_libraries(<URI модуля>Lib PRIVATE Qt6::Quick Qt6::QuickControls2)

# Обычные QML файлы
set(plain_qml_files
    <Путь до файла .qml>
)

# Если нужно создать singleton
set(qml_singletons
    <Путь до файла .qml>
)

set_source_files_properties(${qml_singletons}
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(<URI модуля>Lib
    URI <URI модуля> #Example: Common
    VERSION 1.0
    QML_FILES ${plain_qml_files} ${qml_singletons}
)
```
3. 