qt_add_library(ComponentsLib STATIC)

set_target_properties(ComponentsLib PROPERTIES AUTOMOC ON)
target_link_libraries(ComponentsLib PRIVATE Qt6::Quick Qt6::QuickControls2)

set(plain_qml_files
    Delegates/DelegateDayWeekHome.qml
    Delegates/DelegateHomeScreenEvents.qml
    Delegates/DelegateSettingsList.qml

    FooterPanel.qml
    TopPanel.qml
)

set(resource_files
    FooterPanel_Form.ui.qml
    TopPanel_Form.ui.qml
)

qt_add_qml_module(ComponentsLib
        URI Components
        VERSION 1.0
        RESOURCES ${resource_files}
        QML_FILES ${plain_qml_files}
)
