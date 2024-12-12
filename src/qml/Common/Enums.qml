pragma Singleton

import QtQuick

QtObject {
    id: enums

    enum PageEnumeration {
        SPLASH_PAGE = 0,
        AUTHENTICATION_PAGE,
        MAIN_MENU_PAGE,
        WELCOME_PAGE,
        ALARM_AND_NOTIFICATIONS_PAGE,
        ALARM_PAGE
        // ...
    }


} // QtObject
