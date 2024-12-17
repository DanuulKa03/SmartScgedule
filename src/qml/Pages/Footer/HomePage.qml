import QtQml
import QtQuick.Controls

HomePage_Form {
    id: homePage_Form

    Component.onCompleted: {
        ApplicationWindow.window.footerVisible = true;
    }
}
