import QtQuick
import QtQuick.Controls

import Components as Components
import Forms as Forms
import Models as Models

Forms.TitleListForm {
    id: titleListForm
    pageName: qsTr("Будильник")

    delegateForm: Components.DelegateSettingsList {}
    modelForm: Models.AlarmModel {}
    titleText: qsTr("Будильник")
    smallDescriptionText: qsTr("По умолчанию будильник будет срабатывать за час до события")
    isSmallDescription: true

    Component.onCompleted: () => {
        ApplicationWindow.window.footerVisible = true;
    }
}
