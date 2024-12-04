pragma Singleton

import QtQuick

QtObject {
    id: fonts

    property FontLoader inter: FontLoader {
        id: inter
        source: "qrc:/qt/qml/SmartSchedule/res/fonts/Inter.ttf"
    }

    readonly property alias family: inter.name
}
