*** Settings ***
Library  AppiumLibrary
Resource  Variables.robot
*** Keywords ***
Open And Load
    Open Application  http://localhost:4723/wd/hub  platformName=Android  platformVersion=10.0  deviceName=Pixel 3  pkg=eu.smartpatient.mytherapy
User Skip Settings
    Wait Until Page Contains ELement  id=eu.smartpatient.mytherapy:id/getStartedButton
    Click Element  id=eu.smartpatient.mytherapy:id/getStartedButton
User Information
    Wait Until Page Contains ELement   id=eu.smartpatient.mytherapy:id/genderView
    Click Element  id=eu.smartpatient.mytherapy:id/genderView
    Wait Until Page Contains ELement   id=android:id/numberpicker_input
    Click Element  id=android:id/numberpicker_input
    Wait Until Page Contains ELement  id=android:id/button1
    Click Element  id=android:id/button1
    Wait Until Page Contains ELement    id=eu.smartpatient.mytherapy:id/yearOfBirthView
    Click Element  id=eu.smartpatient.mytherapy:id/yearOfBirthView
    Wait Until Page Contains ELement  id=android:id/numberpicker_input
    Click Element  id=android:id/numberpicker_input
    Wait Until Page Contains ELement  id=android:id/button1
    Click Element  id=android:id/button1
    Wait Until Page Contains ELement  id=eu.smartpatient.mytherapy:id/nextButton
    Click Element  id=eu.smartpatient.mytherapy:id/nextButton
Choose Remainder
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/addMedicationButton
    Click Element  id=eu.smartpatient.mytherapy:id/addMedicationButton
Input medication name
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/searchView
    Click Element  id=eu.smartpatient.mytherapy:id/searchView
    Input Text  id=eu.smartpatient.mytherapy:id/searchView  ${medicationName}
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/unitIconView
    Click Element  id=eu.smartpatient.mytherapy:id/unitIconView
Input Pills
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/summaryView
    Click Element  id=eu.smartpatient.mytherapy:id/summaryView
    Wait Until Page Contains Element  id=android:id/button1
    Click Element  id=android:id/button1
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/nextButton
    Click Element  id=eu.smartpatient.mytherapy:id/nextButton
Add Alarm
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/weekDayTimesAddView
    Click Element  id=eu.smartpatient.mytherapy:id/weekDayTimesAddView
    Wait Until Page Contains Element  id=android:id/button1
    Click Element  id=android:id/button1
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/spontaneousIntakeMethodView
    Click Element  id=eu.smartpatient.mytherapy:id/spontaneousIntakeMethodView
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/saveButton
    Click Element  id=eu.smartpatient.mytherapy:id/saveButton
Verify That Remainder added
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/alarmIcon
Log Into Account With Invalid Data
    [Arguments]  &{credentions}
    AppiumLibrary.Wait Until Page Contains Element  accessibility_id=Settings
    AppiumLibrary.Click Element   accessibility_id=Settings
    AppiumLibrary.Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/myDataButton
    AppiumLibrary.Click Element  id=eu.smartpatient.mytherapy:id/myDataButton
    AppiumLibrary.Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/loginView
    AppiumLibrary.Click Element   id=eu.smartpatient.mytherapy:id/loginView
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/emailEditText
    Click Element  id=eu.smartpatient.mytherapy:id/emailEditText
    AppiumLibrary.Input Text  id=eu.smartpatient.mytherapy:id/emailEditText   ${credentions}[UserName]
    AppiumLibrary.Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/passwordEditText
    AppiumLibrary.Click Element  id=eu.smartpatient.mytherapy:id/passwordEditText
    AppiumLibrary.Input Text  id=eu.smartpatient.mytherapy:id/passwordEditText   ${credentions}[UserPassword]
    AppiumLibrary.Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/loginButton
    AppiumLibrary.Click Element  id=eu.smartpatient.mytherapy:id/loginButton
Verify Error Message, When User Log Into Account With Invalid Data
    [Arguments]  &{credentions}
    Wait Until Page Contains  ${credentions}[ErrorMessage]
    Wait Until Page Contains Element  id=android:id/button1
    Click Element   id=android:id/button1
Log Into Account And See A Correct Error Message
    [Arguments]  &{credentions}
    Log Into Account With Invalid Data  &{credentions}
    Verify Error Message, When User Log Into Account With Invalid Data  &{credentions}
Log In With A Correct Data
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/emailEditText
    Click Element  id=eu.smartpatient.mytherapy:id/emailEditText
    AppiumLibrary.Input Text  id=eu.smartpatient.mytherapy:id/emailEditText   ${email}
    Press Keykode  ENTER
    Press Keykode  ENTER
    AppiumLibrary.Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/passwordEditText
    AppiumLibrary.Click Element  id=eu.smartpatient.mytherapy:id/passwordEditText
    AppiumLibrary.Input Password  id=eu.smartpatient.mytherapy:id/passwordEditText   ${password}
    Press Keykode  ENTER
    Hide Keyboard
    AppiumLibrary.Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/loginButton
    AppiumLibrary.Click Element  id=eu.smartpatient.mytherapy:id/loginButton
Verify That User With A Correct Data Log In
    Wait Until Page Contains Element  id=com.google.android.gms:id/credential_save_reject
    Click Element  id=com.google.android.gms:id/credential_save_reject
    Set Appium Timeout  60
    AppiumLibrary.Wait Until Page Contains Element  accessibility_id=Settings
    AppiumLibrary.Click Element   accessibility_id=Settings
    AppiumLibrary.Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/myDataButton
    AppiumLibrary.Click Element  id=eu.smartpatient.mytherapy:id/myDataButton
    Wait Until Page Contains Text  ${email}
Add personal Data
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/genderView
    Click Element  id=eu.smartpatient.mytherapy:id/genderView
    Wait Until Page Contains Element  id=android:id/numberpicker_input
    Click Element  id=android:id/numberpicker_input
    Wait Until Page Contains Element  id=android:id/button1
    Click Element  id=android:id/button1
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/yearOfBirthView
    Click Element  id=eu.smartpatient.mytherapy:id/yearOfBirthView
    Wait Until Page Contains Element  id=android:id/numberpicker_input
    Click Element  id=android:id/numberpicker_input
    Wait Until Page Contains Element  id=android:id/button1
    Click Element  id=android:id/button1
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/heightView
    Click Element  id=eu.smartpatient.mytherapy:id/heightView
    Wait Until Page Contains Element  id=android:id/button1
    Click Element  id=android:id/button1
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/weightView
    Click Element  id=eu.smartpatient.mytherapy:id/weightView
    Wait Until Page Contains Element  id=android:id/button1
    Click Element  id=android:id/button1
Verify That Users Data Added
    Wait Until Page Contains Element  accessibility_id=Back
    Click Element  accessibility_id=Back
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/myDataButton
    Click Element  id=eu.smartpatient.mytherapy:id/myDataButton
    Wait Until Page Contains Text  female
    Wait Until Page Contains Text  1975
    Wait Until Page Contains Text  70 cm
    Wait Until Page Contains Text  185 kg
Log Out
    Wait Until Page Contains Element  accessibility_id=Back
    Click Element  accessibility_id=Back
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/myDataButton
    Click Element  id=eu.smartpatient.mytherapy:id/myDataButton
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/accountSettingsView
    Click Element  id=eu.smartpatient.mytherapy:id/accountSettingsView
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/logoutView
    Click Element  id=eu.smartpatient.mytherapy:id/logoutView
    Wait Until Page Contains Element  id=android:id/button2
    Click Element  id=android:id/button2
Verify That User Log Out
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/loginButton
Click Forgot Password
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/emailEditText
    Click Element  id=eu.smartpatient.mytherapy:id/emailEditText
    AppiumLibrary.Input Text  id=eu.smartpatient.mytherapy:id/emailEditText   ${email}
    Wait Until Page Contains Element   id=eu.smartpatient.mytherapy:id/resetPasswordButton
    Click Element   id=eu.smartpatient.mytherapy:id/resetPasswordButton
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/emailEditText
    Click Element  id=eu.smartpatient.mytherapy:id/emailEditText
    Input Text  id=eu.smartpatient.mytherapy:id/emailEditText  ${email}
    Wait Until Page Contains Element  id=eu.smartpatient.mytherapy:id/resetButton
    Click Element  id=eu.smartpatient.mytherapy:id/resetButton
    Wait Until Page Contains Element  id=android:id/button1
    Click Element  id=android:id/button1





































    