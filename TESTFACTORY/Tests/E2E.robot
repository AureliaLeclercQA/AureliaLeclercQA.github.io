*** Settings ***
Library   Telnet
Library   String
Library   Collections
Library   SeleniumLibrary
Library   OperatingSystem

Resource  ../Resources/APPS/AppCalc.robot
Resource  ../Resources/APPS/AppGuest.robot
Resource  ../Resources/APPS/AppDede.robot
Resource  ../Resources/SOCLE/keyword_commun.robot
Resource  ../Resources/Common.robot  # for Setup & Teardown

Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test

*** Variables ***
${name1} =    Lou
${name2} =    Léo
${name3} =    Léa


*** Keywords ***
app calc is launched
    AppCalc.Go To App Calc
    AppCalc.Verify app Calc Loaded

app dede is launched
    AppDede.Go To App Dede
    AppDede.Verify app Dede Loaded

*** Test Cases ***

E2E - Test App Calc
    [Documentation]    This test case verifies that the App Calc is launched successfully and do minimal verification.
    app calc is launched

E2E - Test Guest App
    [Documentation]    This test case verifies that the App Guest is launched successfully and do minimal verification.
    [Tags]  TNR
    App Guest Is Launched
    Add 3 Guests    Lea    Leon    Sasha
    Check 3 Guests List    Lea    Leon    Sasha


