*** Settings ***
Documentation    Android test application
Library  AppiumLibrary
Resource  ../Resources/Variables.robot
Resource  ../Resources/Keywords.robot
*** Test Cases ***
User open and load application and skip settings
    Load And Skip Settings
Add user information
    Set Appium Timeout  180
    User Information
User choose the remainder
    Choose Remainder
User Choose tipe of the remainder and input medication name
    Input medication name  azitromicin
    Input Pills
    Add Alarm
    Verify That Remainder added
User Click Settings And Log In
        Click Settings And Log In
User log into account and see a correct error message
    [Tags]   Negativ
    [Template]  Log Into Account And See A Correct Error Message
    &{Correct username but incorrect password}
    &{Correct username but incorrect password}
    &{Incorrect username but correct password}
    &{Incorrect password and incorrect username}
User log in with a correct data
    [Tags]  Positive
    Log In With A Correct Data  bazhenkak@gmail.com  change13
    Verify That User With A Correct Data Log In  bazhenkak@gmail.com
User add personal information
    Add personal Data
    Verify That Users Data Added
User log out
    Log Out
    Verify That User Log Out
User clicked "forgot password" and expect message for reset password
    Click Forgot Password  bazhenkak@gmail.com


