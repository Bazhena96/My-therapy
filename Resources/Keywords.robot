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
    [Arguments]  ${medication name}
    Wait And Click  id=eu.smartpatient.mytherapy:id/searchView
    Input Text  id=eu.smartpatient.mytherapy:id/searchView  ${medication name}
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
Click Settings And Log In
    Wait And Click  accessibility_id=Settings
    Wait And Click  id=eu.smartpatient.mytherapy:id/myDataButton
    Wait And Click  id=eu.smartpatient.mytherapy:id/loginView
Log Into Account With Invalid Data
    [Arguments]  &{credentials}
    Wait And Click  id=eu.smartpatient.mytherapy:id/emailEditText
    AppiumLibrary.Input Text  id=eu.smartpatient.mytherapy:id/emailEditText   ${credentials}[UserName]
    Wait And Click  id=eu.smartpatient.mytherapy:id/passwordEditText
    Input Text  id=eu.smartpatient.mytherapy:id/passwordEditText   ${credentials}[UserPassword]
    Wait And Click  id=eu.smartpatient.mytherapy:id/loginButton
Verify Error Message, When User Log Into Account With Invalid Data
    [Arguments]  &{credentials}
    Wait Until Page Contains Element  ${credentials}[ErrorMessage]
    Click Element  id=android:id/button1
Log Into Account And See A Correct Error Message
    [Arguments]  &{credentials}
    Log Into Account With Invalid Data  &{credentials}
    Verify Error Message, When User Log Into Account With Invalid Data  &{credentials}
Log In With A Correct Data
    [Arguments]  ${email}  ${password}
    Wait And Click  id=eu.smartpatient.mytherapy:id/emailEditText
    Input Text  id=eu.smartpatient.mytherapy:id/emailEditText   ${email}
    Click Email Completion
    Wait And Click  id=eu.smartpatient.mytherapy:id/passwordEditText
    Input Password  id=eu.smartpatient.mytherapy:id/passwordEditText   ${password}
    Wait And Click  id=eu.smartpatient.mytherapy:id/loginButton
Verify That User With A Correct Data Log In
    [Arguments]  ${email}
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
    [Arguments]  ${email}
    Wait And Click  id=eu.smartpatient.mytherapy:id/emailEditText
    AppiumLibrary.Input Text  id=eu.smartpatient.mytherapy:id/emailEditText   ${email}
    Wait And Click   id=eu.smartpatient.mytherapy:id/resetPasswordButton
    Wait And Click  id=eu.smartpatient.mytherapy:id/emailEditText
    Input Text  id=eu.smartpatient.mytherapy:id/emailEditText  ${email}
    Wait And Click  id=eu.smartpatient.mytherapy:id/resetButton
    Wait And Click  id=android:id/button1
Email completion
    Wait And Click  id=android:id/text1
Click Email Completion
    ${button count}  Get Matching Xpath Count  /hierarchy/android.widget.FrameLayout/android.widget.ListView/android.widget.RelativeLayout/android.widget.TextView
    Run Keyword IF  ${button count}>0  Email Completion
Click Reject
    ${button count}  Get Matching Xpath Count  id=com.google.android.gms:id/credential_save_reject
    Run Keyword IF  ${button count}>0  Reject  ELSE
Reject
    Wait And Click  id=com.google.android.gms:id/credential_save_reject






























    