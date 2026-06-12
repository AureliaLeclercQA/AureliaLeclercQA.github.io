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
Library   ../Resources/PYTHON/EmailLibrary.py
Library   Telnet
Library   String
Library   Collections
Library   SeleniumLibrary
Library   OperatingSystem

Resource            ../Resources/Common.robot  # for Setup & Teardown
Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test

*** Variables ***
${MailingBoxGeneration} =      https://yopmail.com/fr/email-generator
${NOM} =    Liguili
${PRENOM} =    Guy

${locator_span_emailGenerated} =    //span[@class="genytxt"][1]
${locator_button_mailAccess} =    //button[@class="md but text f24 egenbut" and @onclick="egengo();"]
${locator_button_refreshMailBox} =    //button[@id="refresh"]


*** Keywords ***


*** Test Cases ***

User wants to register
    [Tags]    E2E    Register
    #Given user is on the web site and is not logged
    LoginPage.Verify Page Loaded
    LoginPage.Verify User Is Not Logged

    #When user execute complete scenario
    ${credential}   Evaluate    keyring.get_credential("CortexIA", "")  modules=keyring
    ${StrongPWD}=   Set Variable    ${credential.password}
    #Open New Tab yopmail + go on yopmail page
    Execute JavaScript    window.open("${MailingBoxGeneration}", "_blank", "noopener,noreferrer")
    Sleep    5s    #wait
    ${yopmail_handle}=    Get Window Handles
    ${yopmail_handle}=    Set Variable    ${yopmail_handle[-1]}
    Switch Window    ${yopmail_handle}
    YopmailPage.Yopmail Close Add PopUp
    #Get the email randomly generated
    ${random}    Get Text    xpath=${locator_span_emailGenerated}
    ${generated_email}    Set Variable    ${random}@yopmail.com
    Log    L'email généré est: ${generated_email}
    #go to cortexIA page
    ${cortexia_handle}=    Get Window Handles
    ${cortexia_handle}=    Set Variable    ${cortexia_handle[0]}
    Switch Window    ${cortexia_handle}
    LoginPage.Click Register Button
    RegisterPage.Fill Out A Form With Used Email    ${PRENOM}    ${NOM}    ${generated_email}    ${StrongPWD}
    RegisterPage.Click Validate Button
    RegisterPage.Message Fin de Parcours
    #wait for mail to be send
    Sleep           10s
    #check mailing box on yopmail
    Switch Window    ${yopmail_handle}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)    #scroll down
    Click Button    xpath=${locator_button_mailAccess}
    Sleep    1s
    Click Button    xpath=${locator_button_refreshMailBox}
    Sleep    1s
    YopmailPage.Extract Link From Yopmail Mailing Box And Go To Link
    RegisterPage.Message Validation Activation Compte
    RegisterPage.Click Connexion From Validation Page
    #Login
    LoginPage.Connect with right username and password    ${PRENOM}    ${generated_email}    ${StrongPWD}
    #Logout
    Homepage.Deconnexion
    LoginPage.Verify Page Loaded
    #Oups forgotten password
    LoginPage.Click Password Forgotten
    ResetPasswordPage.Enter Email    ${generated_email}
    #Go mailing box and refresh
    Switch Window    ${yopmail_handle}
    Click Button    xpath=${locator_button_refreshMailBox}
    YopmailPage.Extract Link From Yopmail Mailing Box And Go To Link
    #Enter a new password
    ${credentialbis}   Evaluate    keyring.get_credential("CortexIA bis", "")  modules=keyring
    ${StrongPWDbis}=   Set Variable    ${credentialbis.password}
    ResetPasswordPage.Enter New Password    ${StrongPWDbis}
    ResetPasswordPage.Check Password Changed
    ResetPasswordPage.Click Redirection Connexion Page
    LoginPage.Verify Page Loaded
    #Login with new password
    LoginPage.Connect with right username and password    ${PRENOM}    ${generated_email}    ${StrongPWDbis}
    
    #Then user is logged
    HomePage.Home says hello
