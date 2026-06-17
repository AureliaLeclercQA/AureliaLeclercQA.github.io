*** Settings ***
Library    Telnet
Library    SeleniumLibrary
Library    collections
Library    OperatingSystem
Library    String

Resource  ../Resources/APPS/AppGuest.robot
Resource  ../Resources/APPS/AppCalc.robot
Resource  ../Resources/APPS/AppDede.robot
Resource  ../Resources/SOCLE/keyword_commun.robot
Resource  ../Resources/Common.robot  # for Setup & Teardown

Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test

*** Variables ***

*** Keywords ***
app dede is launched
    AppDede.Go To App Dede
    AppDede.Verify app Dede Loaded


*** Test Cases ***


TNR Test Guest App
    [Tags]  TNR
    Go To App Guest
    Verify App Guest Loaded
    Add Guest Name    Lea    Leon    Sasha

TNR - Test App Dede - statistical checks
    [Documentation]    Warning: N>60 ! This test case verifies that the App Dede is launched and do statistical verification of the results of 10 rolls of the dice.
    app dede is launched
    Test Dice    1000