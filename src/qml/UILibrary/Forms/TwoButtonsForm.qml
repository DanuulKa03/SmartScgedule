import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Common 1.0 as Common
import Forms 1.0 as Forms

Forms.BaseForm {
    id: twoButtonsForm

    signal leftButtonClicked()
    signal rightButtonClicked()

    property alias leftButtonText: leftButton.text
    property alias rightButtonText: rightButton.text

    footerEnabled: true

    footer: RowLayout {
        id: layout

        anchors {
            fill: parent
            margins: 10 * Common.Consts.radialSize
        }

        spacing: 10 * Common.Consts.xCoord

        Button {
            id: leftButton

            Layout.fillHeight: true
            Layout.fillWidth: true

            onClicked: {
                twoButtonsForm.leftButtonClicked();
            }
        } // RoundButton

        Button {
            id: rightButton

            Layout.fillHeight: true
            Layout.fillWidth: true

            onClicked: {
                twoButtonsForm.rightButtonClicked();
            }
        } // RoundButton
    } // RowLayout
} // Forms.BaseForm
