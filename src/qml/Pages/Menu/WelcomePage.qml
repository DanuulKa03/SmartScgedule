import Common as Common
import Pages as Pages

WelcomePage_Form {
    onExitButtonClicked: () => {
                             next(Pages.PageFactory.getLoginPage(Common.Enums.PageEnumeration.ALARM_AND_NOTIFICATIONS));
                         }
}
