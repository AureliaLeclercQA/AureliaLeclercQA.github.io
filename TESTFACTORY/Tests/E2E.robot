*** Settings ***
Library   Telnet
Library   String
Library   Collections
Library   SeleniumLibrary
Library   OperatingSystem

Resource  ../Resources/APPS/AppCalc.robot
Resource  ../Resources/APPS/AppGuest.robot
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
    
*** Test Cases ***

E2E - Test App Calc
    [Documentation]    This test case verifies that the App Calc is launched successfully and do minimal verification.
    app calc is launched

E2E - Test App Guest
    [Documentation]    This test case verifies that the App Guest is launched successfully and do minimal verification.
    AppGuest.Go To App Guest
    AppGuest.Verify App Guest Loaded
    AppGuest.Add Guest Name    ${name1}    ${name2}    ${name3}




