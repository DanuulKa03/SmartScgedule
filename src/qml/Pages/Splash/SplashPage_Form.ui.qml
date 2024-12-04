import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Common 1.0 as Common
import Forms 1.0 as Forms

Forms.BaseForm {
    id: formSplashPage

    signal splashPageClicked()

    pageName: qsTr("Старницы приветствия")

    content: Label {
        id: greetingLabel

        anchors.fill: parent

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: qsTr("ПУКПУКПУКПУК...")

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
