import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Common 1.0 as Common
import Forms 1.0 as Forms

Forms.BaseForm  {
    id: titleForm

    property alias titleText: title.text

    QtObject {
        id: internal

        property color titleColor: "#78D6EB"
    }

    property alias content: contentLayout.children

    content: ColumnLayout {
        id: contentLayout

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        anchors.margins: 20 * Common.Consts.radialSize
        spacing: 20 * Common.Consts.yCoord

        Label {
            id: title

            Layout.fillWidth: true // Для срабатывания перехода на новую строку.
            Layout.maximumHeight: implicitHeight

            color: internal.titleColor
            font {
                bold: true
                family: Common.Fonts.family
                pixelSize: 32 * Common.Consts.fontSize
            }
            wrapMode: Text.WordWrap
        }
    }
}

