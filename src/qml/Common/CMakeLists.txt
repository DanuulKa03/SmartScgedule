qt_add_library(CommonLib STATIC)

set_target_properties(CommonLib PROPERTIES AUTOMOC ON)
target_link_libraries(CommonLib PRIVATE Qt6::Quick)

set(qml_singletons
    Colors.qml
    Consts.qml
    Enums.qml
    Fonts.qml
)

set_source_files_properties(${qml_singletons}
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(CommonLib
    URI Common
    VERSION 1.0
    QML_FILES ${qml_singletons}
)
