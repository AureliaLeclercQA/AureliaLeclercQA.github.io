
*** Settings ***
Documentation  This is some basic info about the whole suite
Resource            ../Resources/Common.robot  # for Setup & Teardown
Resource            ../Resources/CortexIaApp.robot  # for lower level keywords in test cases
#Variables           ../Variables.yaml

##decom
Test Setup          Common.Begin Web Test
Test Teardown       Common.End Web Test

*** Variables ***
#${BROWSER} =        chrome
#${START_URL} =      https://cortexia.innovation-factory.io/
#${LOGIN} =          ysanquer
#${MDP} =            ysanquer



*** Test Cases ***

## Test cases Yaya
Operator wants to validate the preparation of the environment
    [Tags]  TNR    EnvironmentPreparation
    Given operator is logged and is on the environment preparation page
    When user check all the check box of the five steps
    Then user can access training

User wants to log in with right username and password
    [Tags]   TNR    RightLog
    Given user is on the login page
    When user is logged in
    Then user is redirected on home page

User wants to register with already used email
    [Tags]   TNP    RegisterEmailAlreadyUsed
    Given user is on the web site and is not logged
    When user wants to register with already used email
    Then error message appears

User wants to log in with wrong username or password
    [Tags]   TNP    WrongLog
    Given user is on the login page
    When user log in with wrong username or password
    Then the home page doesn t appear


User wants to register
    [Tags]    E2E    Register
    Given user is on the web site and is not logged
    When user execute complete scenario
    Then user is logged

#User wants to change password
#    [Tags]  CHANGEPWD    TNR
#    Given user is on the login page
#    When user forget password
#    Then user can reinitialize it