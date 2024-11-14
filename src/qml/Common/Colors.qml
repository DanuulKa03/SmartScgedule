pragma Singleton

import QtQuick

QtObject {
    id: colors

    // Постоянные цвета, для любой темы
    readonly property QtObject permanentСolors: QtObject {
        readonly property color blackColor: "#000000"

        // ...
    } // QtObject
} // QtObject
