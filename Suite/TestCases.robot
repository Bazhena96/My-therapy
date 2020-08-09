*** Settings ***
Documentation    Android test application
Library  AppiumLibrary
Resource  Variables.robot
Resource  Keywords.robot

*** Test Cases ***
User open and load application and skip settings
    Open And Load
    User Skip Settings
Add user information
    Set Appium Timeout  180
    User Information
User choose the remainder
    Choose Remainder
User Choose tipe of the remainder and input medication name
    Input medication name
    Input Pills
    Add Alarm
    Verify That Remainder added
User log into account and see a correct error message
    [Tags]   Negativ
    [Template]  Log Into Account And See A Correct Error Message
    &{correctUserNameIncorrectPassword}
    &{incorrectUsernameCorrectPassword}
    &{incorrectPasswordIncorrectUsername}
User log in with a correct data
    [Tags]  Positive
    Log In With A Correct Data
User add personal information
    Add personal Data
    Verify That Users Data Added
User log out
    Log Out
    Verify That User Log Out
User clicked "forgot password" and expect message for reset password
    Click Forgot Password
    Verify That User Log Out






