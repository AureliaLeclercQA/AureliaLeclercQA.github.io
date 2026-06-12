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


*** Test Cases ***

Operator wants to validate the preparation of the environment
    [Tags]  TNR    EnvironmentPreparation

    #Given operator is logged and is on the environment preparation page
    ${RegisteredEmail}    ${StrongPWD}=  Set Credentials    CortexIA
    LoginPage.Verify Page Loaded
    LoginPage.Connect with right username and password    Aurelia    ${RegisteredEmail}    ${StrongPWD}
    HomePage.Verify Page Loaded
    HomePage.Click launch a session
    PreparationEnvironmentPage.Verify Page Loaded

    #When user check all the check box of the five steps
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

    #Then user can access training
    TrainingPage.Verify Page Loaded

User wants to log in with right username and password
    [Tags]   TNR    RightLog
    #Given user is on the login page
    LoginPage.Verify Page Loaded

    #When user is logged in
    ${RegisteredEmail}    ${StrongPWD}=  Set Credentials    CortexIA
    LoginPage.Verify Page Loaded
    LoginPage.Connect with right username and password    Aurelia    ${RegisteredEmail}    ${StrongPWD}

    #Then user is redirected on home page
    HomePage.Verify Page Loaded


TNR_inscription
    [Documentation]    Other method: create random email and pwd + create email associated
    LoginPage.Click Register Button
    ${texte} =    Set Variable    Votre compte a été validé avec succés  
    ${nom}    keyword_commun.nom aléatoire         # keyword pour générer un nom aléatoire                                        
    ${prenom}    keyword_commun.prenom aléatoire   # keyword pour générer un prénom aléatoire  
    ${mot_de_passe}    keyword_commun.mot de passe aléatoire avec caractères spéciaux         # keyword pour générer un mot de passe aléatoire    
    ${email}    keyword_commun.email aléatoire avec domaine yopmail    ${nom}       # keyword pour générer un email avec domaine yopmail et un prefixe qui est le nom généré
    RegisterPage.Fill Out A Form With Used Email    ${prenom}    ${nom}    ${email}    ${mot_de_passe}
    RegisterPage.Click Validate Button
    ${message}    keyword_commun.acces au boite mail temporaire et extraction du contenu mail validation compte    ${nom}     # keyword permet d'accéder à la boite créé sur yopmail et retourner le contenu du mail
    ${lien_de_confirmation_compte}    keyword_commun.Get Link From Message    ${message}      # keyword permet d'extraire le lien depuis le mail
    Open Browser    ${lien_de_confirmation_compte}    chrome                          # ouvrir le lien de confirmation recu dans le mail  
    Page Should Contain    ${texte}  # vérifier la validation du compte créé
    #Set Global Variable    ${email}
    #Set Global Variable    ${mot_de_passe} 
