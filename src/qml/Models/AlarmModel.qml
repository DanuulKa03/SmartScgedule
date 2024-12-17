import QtQml.Models

ListModel {
    id: alarmModel

    ListElement {
        name: QT_TR_NOOP("Будильник")
        isSwitch: true
    }
    ListElement {
        name: QT_TR_NOOP("Установить будильник")
        isButton: true
    }
    ListElement {
        name: QT_TR_NOOP("Расписание будильника")
        isButton: true
    }

    /**
     * ListElement {
     *     name: QT_TR_NOOP(<Пункт>)
     *     isButton: <Является ли данный пункт кнопкой>
     *     isSwitch: <Является ли данный пункт переключалкой>
     * }
     */
}
