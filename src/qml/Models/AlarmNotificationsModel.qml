import QtQml.Models

ListModel {
    id: alarmModel

    ListElement {
        name: QT_TR_NOOP("Будильник")
        isButton: true
    }
    ListElement {
        name: QT_TR_NOOP("Режим 'не беспокоить'")
        isButton: true
    }
    ListElement {
        name: QT_TR_NOOP("Напомнить о событии")
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
