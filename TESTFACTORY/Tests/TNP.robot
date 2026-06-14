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


*** Keywords ***


*** Test Cases ***

==== Test Guest App ===
    [Tags]  TNP
    Go To App Guest
    Verify App Guest Loaded
    #TNP: clicher sur ajouter sans avoir saisi de nom d'invité
    #Add Guest Name    Alice    Bob    Carol