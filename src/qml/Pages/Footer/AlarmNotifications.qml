import QtQuick
import QtQuick.Controls

import Components as Components
import Forms as Forms
import Models as Models

Forms.TitleListForm {
    id: titleListForm
    pageName: qsTr("Главное меню")

    delegateForm: Components.DelegateSettingsList {}
    modelForm: Models.AlarmNotificationsModel {}
    titleText: qsTr("Будильник и уведомления")

    Component.onCompleted: () => {
        ApplicationWindow.window.footerVisible = true;
    }
}
