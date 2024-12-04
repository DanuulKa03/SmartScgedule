import QtQml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Common as Common
import Forms as Forms

Forms.TitleForm {
    id: formMainMenuPage
    pageName: qsTr("Главное меню")

    signal exitButtonClicked()

    titleText: qsTr("Возможности")

    QtObject {
        id: internal

        readonly property color titleColor: "#26545C"
        readonly property color buttonTextColor: "#FFFFFF"
        readonly property string titleTextContent: QT_TR_NOOP("Твоё умное расписание")
        readonly property string mainTextContent: QT_TR_NOOP("Планируй учебные дни, добавляй задания и важные события, получай уведомления и отслеживай изменения в расписании. Удобный интерфейс и интуитивно понятная навигация помогут тебе всегда быть в курсе всех мероприятий и занятий!")
    }

    content: [
        Label {

            Layout.fillWidth: true
            Layout.preferredHeight: implicitHeight

            color: internal.titleColor
            font {
                bold: true
                family: Common.Fonts.family
                pixelSize: 22 * Common.Consts.fontSize
            }
            text: internal.titleTextContent
            wrapMode: Text.WordWrap
        },
        Label {

            Layout.fillWidth: true
            Layout.preferredHeight: implicitHeight

            color: Common.Colors.designColor.darkText
            font {
                family: Common.Fonts.family
                pixelSize: 15 * Common.Consts.fontSize
            }
            text: internal.mainTextContent
            wrapMode: Text.WordWrap
        }
    ]

    Button {
        id: buttonExit

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom

            leftMargin: 40 * Common.Consts.xCoord
            rightMargin: 40 * Common.Consts.xCoord
            bottomMargin: 50 * Common.Consts.yCoord
        }

        height: 50 * Common.Consts.yCoord

        background: Rectangle {
            id: backRec

            color: Common.Colors.designColor.brightPrimaryColor
            radius: 8 * Common.Consts.radialSize
        }
        contentItem: Label {
            id: conLabel
            color: internal.buttonTextColor
            font {
                bold: true
                family: Common.Fonts.family
                pixelSize: 32 * Common.Consts.fontSize
            }
            text: qsTr("Начать")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
        display: AbstractButton.TextOnly

        icon.source: "qrc:/qt/qml/SmartSchedule/res/icons/footer/home-icon.svg"

        onClicked: formMainMenuPage.exitButtonClicked()

        states: State {
            name: "clicked"
            when: buttonExit.pressed
            PropertyChanges { target: backRec; color: Qt.darker(backRec.color, 1.5) }
            PropertyChanges { target: conLabel; color: Qt.darker(conLabel.color, 1.5)}
        }
    }
}
