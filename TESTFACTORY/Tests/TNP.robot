*** Settings ***
Resource  ../Resources/PO/HomePage.robot
Resource  ../Resources/PO/LoginPage.robot
Resource  ../Resources/PO/PlayingPage.robot
Resource  ../Resources/PO/PreparationEnvironmentPage.robot
Resource  ../Resources/PO/RegisterPage.robot
Resource  ../Resources/PO/ResetPasswordPage.robot
Resource  ../Resources/PO/TrainingPage.robot
Resource  ../Resources/PO/YopmailPage.robot

Resource  ../Resources/SOCLE/keyword_commun.robot
Library    Telnet
Library    SeleniumLibrary
Library    collections
Library    OperatingSystem
Library    String

Resource            ../Resources/Common.robot  # for Setup & Teardown
Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test

*** Variables ***


*** Keywords ***


*** Test Cases ***

User wants to register with already used email
    [Tags]   TNP    RegisterEmailAlreadyUsed
    #Given user is on the web site and is not logged
    LoginPage.Verify Page Loaded
    LoginPage.Verify User Is Not Logged

    #When user wants to register with already used email
    ${RegisteredEmail}    ${StrongPWD}=  Set Credentials    CortexIA
    LoginPage.Verify Page Loaded
    LoginPage.Click Register Button
    RegisterPage.Fill Out A Form With Used Email    PRENOM    NOM    ${RegisteredEmail}    ${StrongPWD}
    RegisterPage.Click Validate Button  

    #Then error message appears
    RegisterPage.Message Erreur Email Utilisé


User wants to log in with wrong username or password
    [Tags]   TNP    WrongLog
    #Given user is on the login page
    LoginPage.Verify Page Loaded

    #When user log in with wrong username or password
    LoginPage.Connect with wrong username or password

    #Then the home page doesn t appear
    LoginPage.Message wrong email or password
    LoginPage.Verify Page Loaded
