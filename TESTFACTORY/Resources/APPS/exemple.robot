*** Settings ***
Library  SeleniumLibrary
Resource    PreparationEnvironmentPage.robot

*** Variables ***
${locator_button_?} =    //button[@routerlink="/training/steps"]
${locator_element_?} =    //label[text()="Déconnexion"]

*** Keywords ***
Verify Page Loaded
    Location Should Be      http://??     message = La Home page n existe pas
    Sleep    2s

Click launch a session
    Click Button    xpath=${locator_button_?}
    Sleep    1s

Home says hello
    Wait Until Page Contains    ?

