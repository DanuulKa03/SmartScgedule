import QtQuick

import Common 1.0 as Common

Item {
    id: root

    property string pageName: ""

    signal back()
    signal next(Component page)
    // дополнительные сигналы для логики перехода между страницыми

    signal update()

    property bool footerEnabled: false
	
    property alias content: bodyItem.children
    property alias footer: footerArea.children

    Item {
        id: bodyItem

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: footerArea.top
        }
    } // Item

    Item {
        id: footerArea

        height: root.footerEnabled ? 200 * Common.Consts.yCoord : 0

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    } // Item
} // Item
