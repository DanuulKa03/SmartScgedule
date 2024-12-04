pragma Singleton

import QtQuick

QtObject {
    id: consts

    readonly property int mockupScreenWidth: 360
    readonly property int mockupScreenHeight: 800

    readonly property int screenWidth: Screen.width
    readonly property int screenHeight: Screen.height

    readonly property real xCoord: Screen.primaryOrientation === Qt.PortraitOrientation
                                   ? screenWidth / mockupScreenWidth
                                   : mockupScreenWidth / screenWidth
    readonly property real yCoord: Screen.primaryOrientation === Qt.PortraitOrientation
                                   ? screenHeight / mockupScreenHeight
                                   : mockupScreenHeight / screenHeight

    readonly property real radialSize: Math.min(xCoord, yCoord)
    readonly property real fontSize: Math.max(xCoord, yCoord)

    readonly property int mainRadiusComponent: 2 * radialSize
    readonly property int pixelSize: 100 * fontSize

    // ...
} // QtObject
