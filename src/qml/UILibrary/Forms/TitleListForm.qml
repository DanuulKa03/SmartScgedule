import QtQuick
import QtQuick.Layouts

import Common as Common

TitleForm {

    property alias delegateForm: listViewForm.delegate
    property alias modelForm: listViewForm.model

    content: ListView {
        id: listViewForm

        Layout.fillHeight: true
        Layout.fillWidth: true

        boundsBehavior: Flickable.StopAtBounds
        clip: true
        flickableDirection: Flickable.VerticalFlick
        orientation: ListView.Vertical
        spacing: 22 * Common.Consts.yCoord
    }
}
