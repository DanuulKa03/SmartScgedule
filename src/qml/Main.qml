import QtQml
import QtQuick
import QtQuick.Controls

import Common 1.0 as Common
import Components 1.0 as Components

ApplicationWindow {
    id: applicationWindow

    property bool footerVisible: true

    height: Common.Consts.screenHeight
    width: Common.Consts.screenWidth

    visible: true
    title: "Architectural-Template-Qt-QML"

    StackView {
        id: contentFrame

        anchors.fill: parent

        Component.onCompleted: {
            contentFrame.push("qrc:/qt/qml/Pages/Splash/SplashPage.qml");
        }
        onCurrentItemChanged: {
            contentFrame.currentItem.forceActiveFocus(Qt.MouseFocusReason);
        }

        Connections {
            function onBack() {
                contentFrame.pop();
            }
            function onNext(page) {
                contentFrame.push(page);
            }

            target: contentFrame.currentItem
        } // Connections
    } // StackView

    footer: Components.FooterPanel {
        visible: applicationWindow.footerVisible

        height: 71 * Common.Consts.yCoord

        Connections {
            function onNext(page) {
                contentFrame.push(page);
            }
        } // Connections
    }
} // ApplicationWindow
