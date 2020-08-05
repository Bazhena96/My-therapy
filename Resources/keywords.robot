*** Settings ***
Library  AppiumLibrary
Resource  Variables.robot
*** Keywords ***
Open and Load
    Open Application  http://localhost:4723/wd/hub  platformName=Android  platformVersion=10.0  deviceName=Pixel 3  app=