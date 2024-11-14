import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Common 1.0 as Common
import Forms 1.0 as Forms

Forms.BaseForm {
    id: formSplashPage
    pageName: qsTr("Старницы приветствия")

    signal splashPageClicked()

    content: Label {
        id: greetingLabel

        anchors.fill: parent

        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter

        text: qsTr("Приветствие...")

        font.pixelSize: 40 * Common.Consts.fontSize

        MouseArea {
            id: mouseArea

            anchors.fill: parent

            Connections {
                target: mouseArea

                function onClicked() {
                    formSplashPage.splashPageClicked();
                }
            } // Connections
        } // MouseArea
    } // Label
} // Forms.BaseForm
