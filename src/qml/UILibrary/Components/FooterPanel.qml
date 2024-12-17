import QtQml

import Common as Common
import Pages as Pages

FooterPanel_Form {

    signal next(Component page)

    onHomeClicked: () => {
                       next(Pages.PageFactory.getLoginPage(Common.Enums.PageEnumeration.HOME_PAGE));
                   }

    onAlarmClicked: () => {
                        next(Pages.PageFactory.getLoginPage(Common.Enums.PageEnumeration.ALARM_PAGE));
                    }
}
