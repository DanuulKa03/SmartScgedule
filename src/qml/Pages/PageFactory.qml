pragma Singleton

import QtQuick

import Common 1.0 as Common
import Pages 1.0 as Pages

QtObject {
    id: pageFactory

    function getLoginPage(pageId) {
        var page;

        switch (pageId) {
        case Common.Enums.PageEnumeration.AUTHENTICATION_PAGE:
            page = Qt.createComponent("Login/AuthenticationPage.qml");
            break;
        case Common.Enums.PageEnumeration.MAIN_MENU_PAGE:
            page = Qt.createComponent("Menu/MainMenuPage.qml");
            break;
        case Common.Enums.PageEnumeration.WELCOME_PAGE:
            page = Qt.createComponent("Menu/WelcomePage.qml");
            break;
        default:
            console("---> " + pageId);
        }

        return page;
    }
}
