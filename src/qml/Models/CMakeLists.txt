qt_add_library(ModelsLib STATIC)

set_target_properties(ModelsLib PROPERTIES AUTOMOC ON)
target_link_libraries(ModelsLib PRIVATE Qt6::Quick)


set(plain_qml_files
    AlarmModel.qml
    AlarmNotificationsModel.qml
)

qt_add_qml_module(ModelsLib
        URI Models
        VERSION 1.0
        QML_FILES ${plain_qml_files}
)
