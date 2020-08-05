*** Settings ***
Documentation    Android test application
Library  AppiumLibrary
Resource  ../Resources/variables.robot
Resource  ../Resources/keywords.robot

*** Test Cases ***
User open and load application
    Open and Load
    Close Application

