import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Common 1.0 as Common
import Forms 1.0 as Forms

Forms.BaseForm {
    id: formMainMenuPage
    pageName: qsTr("Главное меню")

    signal exitButtonClicked()
    signal settingButtonClicked()

    QtObject {
        id: internal

        readonly property int buttonHeight: 150 * Common.Consts.yCoord
        readonly property int buttonWidth:  1000 * Common.Consts.xCoord
    } // QtObject

    content: ColumnLayout {
        id: body

        anchors.centerIn: parent

        spacing: 10 * Common.Consts.yCoord

        Button {
            id: settingButton

            Layout.preferredHeight: internal.buttonHeight
            Layout.preferredWidth: internal.buttonWidth

            text: qsTr("Настройки")

            Connections {
                target: settingButton

                function onClicked() {
                    formMainMenuPage.settingButtonClicked();
                }
            } // Connections
        } // RoundButton

        Button {
            id: exitButton

            Layout.preferredHeight: internal.buttonHeight
            Layout.preferredWidth: internal.buttonWidth

            text: qsTr("Выход")

            Connections {
                target: exitButton

                function onClicked() {
                    formMainMenuPage.exitButtonClicked();
                }
            } // Connections
        } // RoundButton
    } // ColumnLayout
} // Forms.BaseForm
