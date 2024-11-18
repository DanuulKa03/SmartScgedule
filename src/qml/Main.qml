import QtQuick
import QtQuick.Controls
import QtQuick.Window

import Common 1.0 as Common
import Components 1.0 as Components

ApplicationWindow {
    id: applicationWindow

    property bool headerVisible: true

    height: Common.Consts.screenHeight
    title: "Architectural-Template-Qt-QML"
    visible: true
    width: Common.Consts.screenWidth

    Component.onCompleted: {
        Common.Consts.target = topPanel.container;
    }

    Components.TopPanel {
        id: topPanel
        height: applicationWindow.headerVisible ? 150 * Common.Consts.yCoord : 0
        title: contentFrame.currentItem.pageName ? contentFrame.currentItem.pageName : ""
        visible: applicationWindow.headerVisible

        onBack: {
            contentFrame.pop();
        }
        onNext: page => {
            contentFrame.push(page);
        }

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
    } // Components.TopPanel
    StackView {
        id: contentFrame
        Component.onCompleted: {
            contentFrame.push("qrc:/qt/qml/Pages/Splash/SplashPage.qml");
        }
        onCurrentItemChanged: {
            contentFrame.currentItem.forceActiveFocus(Qt.MouseFocusReason);
        }

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            top: topPanel.bottom
        }
        Connections {
            function onBack() {
                contentFrame.pop();
            }
            function onNext(page) {
                contentFrame.push(page);
            }

            // дополнительные функции перехода между страницами

            target: contentFrame.currentItem
        } // Connections
    } // StackView
} // ApplicationWindow
