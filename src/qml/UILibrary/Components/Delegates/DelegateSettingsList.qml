import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Common as Common

ColumnLayout {
    id: root

    required property var model

    height: 75 * Common.Consts.yCoord
    width: ListView.view.width
    spacing: 0

    Button {
        id: mainButton

        Layout.fillWidth: true
        Layout.preferredHeight: root.height

        background: Rectangle {
            color: mainButton.pressed ? Common.Colors.designColor.lightEasyHighlighting : "transparent"
        }

        contentItem: Control {
            anchors.fill: parent

            leftPadding: 25 * Common.Consts.xCoord

            contentItem: Item {
                Label {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter

                    font {
                        family: Common.Fonts.family
                        pixelSize: 20 * Common.Consts.fontSize
                    }
                    text: root.model.name
                }

                Switch {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter

                    visible: root.model.isSwitch ?? false
                }

                Image {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter

                    source: "qrc:/qt/qml/SmartSchedule/res/icons/right-arrow-icon.svg"
                    visible: root.model.isButton ?? false

                    sourceSize.width: 24 * Common.Consts.xCoord
                    fillMode: Image.PreserveAspectFit

                }
            }
        }
    }

    ToolSeparator {
        Layout.fillWidth: true

        contentItem: Rectangle {
            implicitWidth: 0.5 * Common.Consts.xCoord
            implicitHeight: 0.5 * Common.Consts.yCoord
            color: Common.Colors.designColor.darkText
        }

        padding: 0
        spacing: 0
        orientation: Qt.Horizontal
    }
}
