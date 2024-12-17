import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Common as Common

Button {
    id: root

    required property int index

    QtObject {
        id: internal

        property color textColor: "#538B95"
    }

    background: Rectangle {
        color: "white"
        radius: 20
    }

    contentItem: ColumnLayout {
        id: layoutText

        anchors.centerIn: parent

        Text {
            id: day

            Layout.fillHeight: true
            Layout.fillWidth: true

            color: internal.textColor
            font.pixelSize: 13 * Common.Consts.fontSize
            font.family: Common.Fonts.family
            text: {
                // Расчет дня недели для текущего элемента
                let date = new Date();
                date.setDate(root.index + 1);  // Устанавливаем день месяца
                let days = [qsTr("вс"), qsTr("пн"), qsTr("вт"), qsTr("ср"), qsTr("чт"), qsTr("пт"), qsTr("сб")];
                days[date.getDay()];
            }

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            id: dayNumber

            Layout.fillHeight: true
            Layout.fillWidth: true

            color: internal.textColor
            font.bold: true
            font.family: Common.Fonts.family
            font.pixelSize: 22 * Common.Consts.fontSize
            text: root.index + 1

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    onClicked: {
        console.log("Button clicked!");
    }
}
