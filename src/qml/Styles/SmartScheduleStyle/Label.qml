import QtQuick
import QtQuick.Templates as Template

import Common 1.0 as Common

Template.Label {
    id: label

    color: Common.Colors.designColor.darkText

    font {
        family: Common.Fonts.family
        bold: true
        pixelSize: 150
    }

    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
}
