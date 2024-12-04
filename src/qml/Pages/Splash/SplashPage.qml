import QtQuick
import QtQuick.Controls

import Common 1.0 as Common
import Pages 1.0 as Pages

SplashPage_Form {
    id: formSplashPage

    Component.onCompleted: () => {
        ApplicationWindow.window.footerVisible = false;
    }

    onSplashPageClicked: {
        next(Pages.PageFactory.getLoginPage(Common.Enums.PageEnumeration.WELCOME_PAGE));
    }
} // SplashPage_Form
