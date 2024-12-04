pragma Singleton

import QtQuick

QtObject {
    id: colors

    // Постоянные цвета, для любой темы
    readonly property QtObject permanentСolors: QtObject {
        readonly property color blackColor: "#000000"
        // ...
    }

    // https://www.figma.com/design/4JV74Maxoz3Sba376UzhWB/Schedule?node-id=10-82&t=FEMEbAIEkma1ZPCj-4
    readonly property QtObject designColor: QtObject {
        readonly property color calmBaseColor:         "#538B95" // Cпокойный основной цвет
        readonly property color brightPrimaryColor:    "#89DFEE" // Яркий основной цвет
        readonly property color menuBarColor:          "#DCEBED" // Цвет панели меню
        readonly property color mainBackground:        "#FFFFFF" // Основной фон
        readonly property color darkBaseColor:         "#26545C" // Темный основной цвет
        readonly property color darkText:              "#021F24" // Темный, для текста
        readonly property color lightEasyHighlighting: "#EAEAEA" // Cветлый для легкого выделения
    }
}
