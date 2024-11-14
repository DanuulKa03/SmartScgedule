qt_add_library(ComponentsLib STATIC)

set_target_properties(ComponentsLib PROPERTIES AUTOMOC ON)
target_link_libraries(ComponentsLib PRIVATE Qt6::Quick Qt6::QuickControls2)

set(plain_qml_files
        TopPanel.qml
)

set(resource_files
        TopPanel_Form.ui.qml
)

qt_add_qml_module(ComponentsLib
        URI Components
        VERSION 1.0
        QML_FILES ${plain_qml_files}
        RESOURCES ${resource_files}
)
