*** Settings ***
Library  SeleniumLibrary

*** Variables ***
#${PORTFOLIO_URL}  https://aurelialeclercqa.github.io/
${APP_GUEST}      xpath=//div[@id="app_guest"]
${guest_name_input}=    xpath=//input[@id="guest-name"]
${add_guest_button}=    xpath=//button[@id="add-btn"]
${gender_male_radio}=    xpath=//input[@id="gender-male"]
${gender_female_radio}=    xpath=//input[@id="gender-female"]
    

*** Keywords ***
Go To App Guest
    Click Element    ${APP_GUEST}
    Wait Until Page Contains    Ma liste d'invités    timeout=5s

Verify App Guest Loaded
    Location Should Be    https://aurelialeclercqa.github.io/pages/guest.html 

Add Guest Name
    [Arguments]    ${guest_name1}    ${guest_name2}    ${guest_name3}
    Input Text    ${guest_name_input}    ${guest_name1}
    Click Element    ${add_guest_button}
    Input Text    ${guest_name_input}    ${guest_name2}
    Click Element    ${gender_male_radio}
    Click Element    ${add_guest_button}
    Input Text    ${guest_name_input}    ${guest_name3}
    Click Element    ${gender_female_radio}
    Click Element    ${add_guest_button}

Check Guest List
    [Arguments]    ${guest_name1}    ${guest_name2}    ${guest_name3}
    Wait Until Page Contains    ${guest_name1}    timeout=5s
    Wait Until Page Contains    ${guest_name2}    timeout=5s
    Wait Until Page Contains    ${guest_name3}    timeout=5s