*** Settings ***
Resource  ../Resources/PO/LoginPage.robot
Resource  ../Resources/PO/TrainingPage.robot
Resource  ../Resources/PO/HomePage.robot
Resource  ../Resources/PO/PlayingPage.robot
Resource  ../Resources/PO/RegisterPage.robot
Resource  ../Resources/PO/PreparationEnvironmentPage.robot
Resource  ../Resources/E2E/E2E.robot
Library    Telnet

*** Variables ***
${RegisteredEmail}
${StrongPWD}

*** Keywords ***

Set Credentials
    [Arguments]    ${credentialID}
    ${initial_log_level}  Set Log Level  NONE
    ${credential}  Evaluate  keyring.get_credential("${credentialID}", "")  modules=keyring
    ${RegisteredEmail}=  Set Variable  ${credential.username}
    ${StrongPWD}=  Set Variable  ${credential.password}
    Set Log Level  ${initial_log_level}
    RETURN    ${RegisteredEmail}    ${StrongPWD}

user is logged in
    ${RegisteredEmail}    ${StrongPWD}=  Set Credentials    CortexIA
    LoginPage.Verify Page Loaded
    LoginPage.Connect with right username and password    Aurelia    ${RegisteredEmail}    ${StrongPWD}

the training page appears
    TrainingPage.Verify Page Loaded

the playing page appears
    PlayingPage.Verify Page Loaded

user is on the web site and is not logged
    LoginPage.Verify Page Loaded
    LoginPage.Verify User Is Not Logged

# ajout etapes validation env (in dev)
operator is logged and is on the environment preparation page
    ${RegisteredEmail}    ${StrongPWD}=  Set Credentials    CortexIA
    LoginPage.Verify Page Loaded
    LoginPage.Connect with right username and password    Aurelia    ${RegisteredEmail}    ${StrongPWD}
    HomePage.Verify Page Loaded
    HomePage.Click launch a session
    PreparationEnvironmentPage.Verify Page Loaded
    
user check all the check box of the five steps
    PreparationEnvironmentPage.Click Next0
    PreparationEnvironmentPage.Check Step1
    PreparationEnvironmentPage.Click Next1
    PreparationEnvironmentPage.Check Step2
    PreparationEnvironmentPage.Click Next2
    PreparationEnvironmentPage.Check Step3
    PreparationEnvironmentPage.Click Next3
    PreparationEnvironmentPage.Check Step4
    PreparationEnvironmentPage.Click Next4
    PreparationEnvironmentPage.Check Condition Step5
    PreparationEnvironmentPage.Click Accept Step5
    PreparationEnvironmentPage.Add Optionnal Comment
    PreparationEnvironmentPage.Click Start Session

user can access training
    TrainingPage.Verify Page Loaded

user wants to register with already used email
    ${RegisteredEmail}    ${StrongPWD}=  Set Credentials    CortexIA
    LoginPage.Verify Page Loaded
    LoginPage.Click Register Button
    RegisterPage.Fill Out A Form With Used Email    PRENOM    NOM    ${RegisteredEmail}    ${StrongPWD}
    RegisterPage.Click Validate Button    

error message appears
    RegisterPage.Message Erreur Email Utilisé

user is on the login page
    LoginPage.Verify Page Loaded
    
user log in with wrong username or password
    LoginPage.Connect with wrong username or password

the home page doesn t appear
    LoginPage.Message wrong email or password
    LoginPage.Verify Page Loaded

user is redirected on login page
    LoginPage.Verify Page Loaded

user is redirected on home page
    HomePage.Verify Page Loaded

user execute complete scenario
    E2E.Complete Scenario

user is logged
    HomePage.Home says hello


    