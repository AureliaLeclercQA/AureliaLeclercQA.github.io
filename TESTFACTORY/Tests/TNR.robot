*** Settings ***
Resource  ../Resources/APPS/AppGuest.robot
Resource  ../Resources/APPS/AppCalc.robot
Resource  ../Resources/SOCLE/keyword_commun.robot
Resource            ../Resources/Common.robot  # for Setup & Teardown

Library    Telnet
Library    SeleniumLibrary
Library    collections
Library    OperatingSystem
Library    String

Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test

*** Variables ***


*** Test Cases ***
==== Test Guest App ===
    [Tags]  TNR
    Go To App Guest
    Verify App Guest Loaded
    Add Guest Name    Lea    Leon    Sasha