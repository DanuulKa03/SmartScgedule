pragma Singleton

import QtQuick

import Common 1.0 as Common

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
        case Common.Enums.PageEnumeration.ALARM_AND_NOTIFICATIONS_PAGE:
            page = Qt.createComponent("Footer/AlarmNotificationsPage.qml");
            break;
        case Common.Enums.PageEnumeration.ALARM_PAGE:
            page = Qt.createComponent("Footer/AlarmPage.qml");
            break;
        default:
            console.log("---> " + pageId); // Proper logging syntax
        }

        if (page === null || page.status === Component.Error) {
            console.log("Failed to load component: " + page.errorString());
        }

        return page;
    }
}
