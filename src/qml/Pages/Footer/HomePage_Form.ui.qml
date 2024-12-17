pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import Common 1.0 as Common
import Components 1.0 as Components
import Forms 1.0 as Forms

Forms.BaseForm  {
    id: homePage_Form

    QtObject {
        id: internal

        property color todayNumberColor: "#26545C"
        property color textColor: "#538B95"

        function getDaysInMonth(year, month) {
            // JavaScript трюк: задаем 0-й день следующего месяца
            return new Date(year, month, 0).getDate();
        }
    }

    property alias todayNumberText: todayNumber.text
    property alias currentDayText: currentDay.text
    property alias currentMonthText: currentMonth.text

    content: ColumnLayout {
        id: contentLayout

        anchors.fill: parent

        GridLayout {
            id: titleLayout

            columns: 2
            rows: 2

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 45 * Common.Consts.xCoord
            Layout.topMargin: 25 * Common.Consts.yCoord

            columnSpacing: 12 * Common.Consts.xCoord
            rowSpacing: 0

            Text {
                id: todayNumber

                Layout.column: 0
                Layout.row: 0
                Layout.rowSpan: 2

                color: internal.todayNumberColor
                font {
                    bold: true
                    family: Common.Fonts.family
                    pixelSize: 50 * Common.Consts.fontSize
                }
                verticalAlignment: Qt.AlignVCenter

                text: Qt.formatDate(new Date(), "dd")
            }

            Text {
                id: currentDay

                Layout.column: 1
                Layout.row: 0

                color: internal.textColor
                font {
                    family: Common.Fonts.family
                    pixelSize: 20 * Common.Consts.fontSize
                }

                text: Qt.formatDate(new Date(), "dddd")
            }

            Text {
                id: currentMonth

                Layout.column: 1
                Layout.row: 1

                color: internal.textColor
                font {
                    family: Common.Fonts.family
                    pixelSize: 20 * Common.Consts.fontSize
                }

                text: Qt.formatDate(new Date(), "MMMM")
            }
        }

        Rectangle {
            id: backgroundListView

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: 0.105

            color: Common.Colors.designColor.menuBarColor

            ListView {
                anchors {
                    fill: parent

                    leftMargin: 15 * Common.Consts.xCoord
                    rightMargin: 15 * Common.Consts.xCoord
                }

                model: {
                    const now = new Date(); // Получаем текущую дату
                    const year = now.getFullYear(); // Извлекаем текущий год
                    const month = now.getMonth() + 1; // Извлекаем текущий месяц (нумерация от 0, поэтому добавляем 1)

                    // Создаём дату с первым днём следующего месяца, чтобы определить последний день текущего месяца
                    const date = new Date(year, month, 0);
                    return date.getDate(); // Возвращаем последний день текущего месяца
                }
                orientation: ListView.Horizontal
                spacing: 12 * Common.Consts.xCoord

                delegate: Components.DelegateDayWeekHome {
                    height: backgroundListView.height
                    width: backgroundListView.height
                }
            }
        }

        Text {
            Layout.leftMargin: 20 * Common.Consts.xCoord

            color: Common.Colors.designColor.darkText
            font {
                family: Common.Fonts.family
                pixelSize: 13 * Common.Consts.fontSize
            }
            text: qsTr("неделя %0").arg("+")
        }

        ListView {
            id: listEvents

            Layout.fillHeight: true
            Layout.fillWidth: true

            clip: true
            model: ListModel {
                ListElement {
                    startTime: "15:32"
                    endTime: "17:37"
                    title: "Название мероприятия"
                    address: "Адрес"
                    teacher: "Преподаватель"
                    note: "Заметка"
                }
                ListElement {
                    startTime: "18:32"
                    endTime: "19:50"
                    title: "Название мероприятия"
                    address: "Адрес"
                    teacher: "Преподаватель"
                    note: "Заметка"
                }
            }
            spacing: 12 * Common.Consts.xCoord

            delegate: Components.DelegateHomeScreenEvents {
            }
        }
    }
}

