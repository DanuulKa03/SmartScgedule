import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Common 1.0 as Common
import Forms 1.0 as Forms

Forms.BaseForm {
    id: oneButtonsForm

    signal buttonClicked()

    property alias buttonText: button.text
    property alias layoutDirection: layout.layoutDirection

    footerEnabled: true

    footer: RowLayout {
        id: layout

        anchors {
            fill: parent
            margins: 10 * Common.Consts.radialSize
        }

        spacing: 10 * Common.Consts.xCoord
        layoutDirection: Qt.LeftToRight

        Button {
            id: button

            Layout.fillHeight: true
            Layout.preferredWidth: layout.width / 2 - 10 * Common.Consts.radialSize

            onClicked: {
                oneButtonsForm.buttonClicked();
            }
        } // Button
    } // RowLayout
} // Forms.BaseForm
