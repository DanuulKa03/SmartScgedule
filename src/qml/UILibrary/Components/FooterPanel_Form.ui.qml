import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: footer

    signal homeClicked
    signal calendarClicked
    signal alarmClicked
    signal settingClicked

    Rectangle {
        anchors.fill: parent

        color: "#DCEBED"

        RowLayout {
            anchors.fill: parent

            Button {
                Layout.fillHeight: true
                Layout.fillWidth: true

                background: null
                display: AbstractButton.IconOnly
                icon.source: "qrc:/qt/qml/SmartSchedule/res/icons/footer/home-icon.svg"

                onClicked: footer.homeClicked()
            }
            Button {
                Layout.fillHeight: true
                Layout.fillWidth: true

                background: null
                display: AbstractButton.IconOnly
                icon.source: "qrc:/qt/qml/SmartSchedule/res/icons/footer/calendar-icon.svg"

                onClicked: footer.calendarClicked()
            }
            Button {
                Layout.fillHeight: true
                Layout.fillWidth: true

                background: null
                display: AbstractButton.IconOnly
                icon.source: "qrc:/qt/qml/SmartSchedule/res/icons/footer/alarm-icon.svg"

                onClicked: footer.alarmClicked()
            }
            Button {
                Layout.fillHeight: true
                Layout.fillWidth: true

                background: null
                display: AbstractButton.IconOnly
                icon.source: "qrc:/qt/qml/SmartSchedule/res/icons/footer/setting-icon.svg"

                onClicked: footer.settingClicked()
            }
        }
    }
}
