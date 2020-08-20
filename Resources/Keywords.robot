*** Settings ***
Library  AppiumLibrary
Resource  Variables.robot
*** Keywords ***
Open And Load
    Open Application  http://localhost:4723/wd/hub  platformName=Android  platformVersion=10.0  deviceName=Pixel 3  pkg=eu.smartpatient.mytherapy
Wait And Click
    [Arguments]  ${locator}
    Wait Until Page Contains Element  ${locator}
    Click Element  ${locator}
User Skip Settings
    Wait And Click  id=eu.smartpatient.mytherapy:id/getStartedButton
Load And Skip Settings
    Open And Load
    User Skip Settings
User Information
    Wait And Click   id=eu.smartpatient.mytherapy:id/genderView
    Wait And Click   id=android:id/numberpicker_input
    Wait And Click  id=android:id/button1
    Wait And Click    id=eu.smartpatient.mytherapy:id/yearOfBirthView
    Wait And Click  id=android:id/numberpicker_input
    Wait And Click  id=android:id/button1
    Wait And Click  id=eu.smartpatient.mytherapy:id/nextButton
Choose Remainder
    Wait And Click  id=eu.smartpatient.mytherapy:id/addMedicationButton
Input medication name
    Wait And Click  id=eu.smartpatient.mytherapy:id/searchView
    Input Text  id=eu.smartpatient.mytherapy:id/searchView  ${medicationName}
    Wait And Click  id=eu.smartpatient.mytherapy:id/unitIconView
Input Pills
    Wait And Click  id=eu.smartpatient.mytherapy:id/summaryView
    Wait And Click  id=android:id/button1
    Wait And Click  id=eu.smartpatient.mytherapy:id/nextButton
Add Alarm
    Wait And Click  id=eu.smartpatient.mytherapy:id/weekDayTimesAddView
    Wait And Click  id=android:id/button1
    Wait And Click  id=eu.smartpatient.mytherapy:id/spontaneousIntakeMethodView
    Wait And Click  id=eu.smartpatient.mytherapy:id/saveButton
Verify That Remainder added
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/alarmIcon
Log Into Account With Invalid Data
    [Arguments]  &{credentions}
    Wait And Click  accessibility_id=Settings
    Wait And Click  id=eu.smartpatient.mytherapy:id/myDataButton
    Wait And Click  id=eu.smartpatient.mytherapy:id/loginView
    Wait And Click  id=eu.smartpatient.mytherapy:id/emailEditText
    AppiumLibrary.Input Text  id=eu.smartpatient.mytherapy:id/emailEditText   ${credentions}[UserName]
    Wait And Click  id=eu.smartpatient.mytherapy:id/passwordEditText
    AppiumLibrary.Input Text  id=eu.smartpatient.mytherapy:id/passwordEditText   ${credentions}[UserPassword]
    Wait And Click  id=eu.smartpatient.mytherapy:id/loginButton
Verify Error Message, When User Log Into Account With Invalid Data
    [Arguments]  &{credentions}
    Wait Until Page Contains  ${credentions}[ErrorMessage]
    Wait And Click  id=android:id/button1
Log Into Account And See A Correct Error Message
    [Arguments]  &{credentions}
    Log Into Account With Invalid Data  &{credentions}
    Verify Error Message, When User Log Into Account With Invalid Data  &{credentions}
Log In With A Correct Data
    Wait And Click  id=eu.smartpatient.mytherapy:id/emailEditText
    AppiumLibrary.Input Text  id=eu.smartpatient.mytherapy:id/emailEditText   ${email}
    Press Keykode  ENTER
    Press Keykode  ENTER
    Wait And Click  id=eu.smartpatient.mytherapy:id/passwordEditText
    AppiumLibrary.Input Password  id=eu.smartpatient.mytherapy:id/passwordEditText   ${password}
    Press Keykode  ENTER
    Hide Keyboard
    Wait And Click  id=eu.smartpatient.mytherapy:id/loginButton
Verify That User With A Correct Data Log In
    Wait And Click  id=com.google.android.gms:id/credential_save_reject
    Set Appium Timeout  60
    Wait And Click  accessibility_id=Settings
    Wait And Click  id=eu.smartpatient.mytherapy:id/myDataButton
    Wait Until Page Contains Text  ${email}
Add personal Data
    Wait And Click  id=eu.smartpatient.mytherapy:id/genderView
    Wait And Click  id=android:id/numberpicker_input
    Wait And Click  id=android:id/button1
    Wait And Click  id=eu.smartpatient.mytherapy:id/yearOfBirthView
    Wait And Click  id=android:id/numberpicker_input
    Wait And Click  id=android:id/button1
    Wait And Click  id=eu.smartpatient.mytherapy:id/heightView
    Wait And Click  id=android:id/button1
    Wait And Click  id=eu.smartpatient.mytherapy:id/weightView
    Wait And Click  id=android:id/button1
Verify That Users Data Added
    Wait And Click  accessibility_id=Back
    Wait And Click  id=eu.smartpatient.mytherapy:id/myDataButton
    Wait Until Page Contains Text  female
    Wait Until Page Contains Text  1975
    Wait Until Page Contains Text  70 cm
    Wait Until Page Contains Text  185 kg
Log Out
    Wait And Click  accessibility_id=Back
    Wait And Click  id=eu.smartpatient.mytherapy:id/myDataButton
    Wait And Click  id=eu.smartpatient.mytherapy:id/accountSettingsView
    Wait And Click  id=eu.smartpatient.mytherapy:id/logoutView
    Wait And Click  id=android:id/button2
Verify That User Log Out
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/loginButton
Click Forgot Password
    Wait And Click  id=eu.smartpatient.mytherapy:id/emailEditText
    AppiumLibrary.Input Text  id=eu.smartpatient.mytherapy:id/emailEditText   ${email}
    Wait And Click   id=eu.smartpatient.mytherapy:id/resetPasswordButton
    Wait And Click  id=eu.smartpatient.mytherapy:id/emailEditText
    Input Text  id=eu.smartpatient.mytherapy:id/emailEditText  ${email}
    Wait And Click  id=eu.smartpatient.mytherapy:id/resetButton
    Wait And Click  id=android:id/button1





































    