qt_add_library(PagesLib STATIC)

set_target_properties(PagesLib PROPERTIES AUTOMOC ON)
target_link_libraries(PagesLib PRIVATE Qt6::Quick Qt6::QuickControls2)

set(plain_qml_files
    Footer/AlarmNotificationsPage.qml
    Footer/AlarmPage.qml
    Footer/AlarmPage_Form.ui.qml
    Footer/HomePage.qml
    Footer/HomePage_Form.ui.qml

    Login/AuthenticationPage.qml
    Login/AuthenticationPage_Form.ui.qml

    Menu/MainMenuPage.qml
    Menu/MainMenuPage_Form.ui.qml
    Menu/WelcomePage.qml
    Menu/WelcomePage_Form.ui.qml

    Splash/SplashPage.qml
    Splash/SplashPage_Form.ui.qml
)

set(qml_singletons
    PageFactory.qml
)

set_source_files_properties(${qml_singletons}
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(PagesLib
    URI Pages
    VERSION 1.0
    QML_FILES ${plain_qml_files} ${qml_singletons}
)
