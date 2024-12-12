import QtQml

import Common as Common
import Pages as Pages

FooterPanel_Form {

    signal next(Component page)

    onAlarmClicked: () => {
                        next(Pages.PageFactory.getLoginPage(Common.Enums.PageEnumeration.ALARM_PAGE));
                    }
}
