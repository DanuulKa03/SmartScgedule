import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Common 1.0 as Common

BaseForm  {
    id: titleForm

    property alias titleText: title.text
    property alias smallDescriptionText: smallDescription.text

    property bool isSmallDescription: false

    QtObject {
        id: internal

        property color titleColor: "#78D6EB"
        property color smallDescriptionColor: "#538B95"
    }

    property alias content: contentLayout.children

    content: ColumnLayout {
        id: contentLayout

        anchors.fill: parent

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

    // Маленькое описание снизу
    Label {
        id: smallDescription

        visible: titleForm.isSmallDescription
        width: titleForm.width * 0.75

        color: internal.smallDescriptionColor
        font {
            bold: true
            family: Common.Fonts.family
            pixelSize: 14 * Common.Consts.fontSize
        }
        wrapMode: Text.WordWrap
    }
}

