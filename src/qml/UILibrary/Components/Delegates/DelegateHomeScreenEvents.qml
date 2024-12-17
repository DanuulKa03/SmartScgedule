pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Common as Common

RowLayout {
    id: root

    required property int index
    required property string startTime
    required property string endTime
    required property string title
    required property string address
    required property string teacher
    required property string note

    spacing: 0
    width: ListView.view.width
    height: eventsControl.implicitHeight

    component TextEditEvents: TextEdit {
        color: root.index % 2 === 0 ? Common.Colors.designColor.calmBaseColor : "FFFFFF"
        font {
            family: Common.Fonts.family
            pixelSize: 20 * Common.Consts.fontSize
        }
    }

    Control {
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredWidth: 0.265 // (72 / 271 ) Из дизайна

        topPadding: 20 * Common.Consts.yCoord
        leftPadding: 10 * Common.Consts.xCoord
        rightPadding: 5 * Common.Consts.xCoord

        contentItem: Column {

            Text {
                color: Common.Colors.designColor.darkText
                font {
                    family: Common.Fonts.family
                    pixelSize: 20 * Common.Consts.fontSize
                }
                text: root.startTime
            }

            Text {
                color: Common.Colors.designColor.calmBaseColor
                font {
                    family: Common.Fonts.family
                    pixelSize: 15 * Common.Consts.fontSize
                }
                text: root.endTime
            }
        }
    }

    Control {
        id: eventsControl

        Layout.fillWidth: true
        Layout.preferredWidth: 1
        implicitHeight: contentItem.implicitHeight + topPadding + bottomPadding

        topPadding: 20 * Common.Consts.yCoord
        leftPadding: 10 * Common.Consts.xCoord
        rightPadding: 10 * Common.Consts.xCoord
        bottomPadding: 20 * Common.Consts.yCoord

        rightInset: 16 * Common.Consts.yCoord

        background: Rectangle {
            color: root.index % 2 === 0 ? Common.Colors.designColor.lightEasyHighlighting : Common.Colors.designColor.brightPrimaryColor
            radius: 10 * Common.Consts.radialSize
        }

        contentItem: Column {

            spacing: 7 * Common.Consts.yCoord

            TextEditEvents {
                font.bold: true
                text: qsTr("Название мероприятия")
            }

            TextEditEvents {
                text: qsTr("Адрес")
            }

            TextEditEvents {
                text: qsTr("Преподаватель")
            }

            TextEditEvents {
                text: qsTr("Заметка")
            }
        }
    }
}
