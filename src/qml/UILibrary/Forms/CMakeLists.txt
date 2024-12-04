qt_add_library(FormsLib STATIC)

set_target_properties(FormsLib PROPERTIES AUTOMOC ON)
target_link_libraries(FormsLib PRIVATE Qt6::Quick Qt6::QuickControls2)


set(plain_qml_files
    BaseForm.qml
    OneButtonForm.qml
    TitleForm.qml
    TwoButtonsForm.qml
)

qt_add_qml_module(FormsLib
    URI Forms
    VERSION 1.0
    QML_FILES ${plain_qml_files}
)
