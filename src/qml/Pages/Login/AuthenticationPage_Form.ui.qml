import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Common 1.0 as Common
import Forms 1.0 as Forms

Forms.TwoButtonsForm {
    id: formAuthenticationPage
    pageName: qsTr("Страница аутентификации")

    leftButtonText: qsTr("Назад")
    rightButtonText: qsTr("Вход")

    property alias username: usernameTextField.text
    property alias password: passwordTextField.text

    QtObject {
        id: internal

        readonly property int height: 100 * Common.Consts.yCoord
        readonly property int width:  300 * Common.Consts.xCoord
    } // QtObject

    content: GridLayout {
        id: body

        anchors.centerIn: parent

        rows: 2
        columns: 2

        Label {
            id: usernameLabel

            Layout.preferredHeight: internal.height
            Layout.preferredWidth: internal.width

            horizontalAlignment: Qt.AlignLeft
            verticalAlignment: Qt.AlignVCenter

            font.pixelSize: 40 * Common.Consts.fontSize

            text: qsTr("Имя:")
        } // Label

        TextField {
            id: usernameTextField

            Layout.preferredHeight: internal.height
            Layout.preferredWidth: 2 * internal.width
        } // TextField

        Label {
            id: passwordLabel

            Layout.row: 1
            Layout.preferredHeight: internal.height
            Layout.preferredWidth: internal.width
            horizontalAlignment: Qt.AlignLeft
            verticalAlignment: Qt.AlignVCenter

            font.pixelSize: 40 * Common.Consts.fontSize

            text: qsTr("Пароль:")
        } // Label

        TextField {
            id: passwordTextField

            Layout.preferredHeight: internal.height
            Layout.preferredWidth: 2 * internal.width
        } // TextField
    } // GridLayout
} // Forms.TwoButtonsForm
