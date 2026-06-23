*** Settings ***
Library  SeleniumLibrary

*** Variables ***
#${PORTFOLIO_URL}  https://aurelialeclercqa.github.io/
${APP_GUEST}            id=app_guest
${URL_GUEST}            https://aurelialeclercqa.github.io/pages/guest.html


${INPUT_NAME}           id=guest-name
${BTN_ADD}              id=add-btn
${BTN_INVITE_ALL}       id=invite-all-btn

${RADIO_MALE}           id=gender-male
${RADIO_FEMALE}         id=gender-female
${RADIO_NEUTRAL}        id=gender-neutral

${GUEST_LIST}           id=guest-container
${INVITE_MESSAGE}       id=invite-all-message

*** Keywords ***
Go To App Guest
    Click Element    ${APP_GUEST}
    Wait Until Page Contains    Ma liste d'invités    timeout=5s

Verify App Guest Loaded
    Location Should Be    ${URL_GUEST}

App Guest Is Launched
    Go To App Guest
    Verify App Guest Loaded

Click Add Guest
    Click Element    ${BTN_ADD}

Select Male Gender
    Click Element    ${RADIO_MALE}

Select Female Gender
    Click Element    ${RADIO_FEMALE}

Select Neutral Gender
    Click Element    ${RADIO_NEUTRAL}

Add Guest
    [Arguments]    ${name}
    Input Text    ${INPUT_NAME}    ${name}
    Click Element    ${BTN_ADD}

Add Male Guest
    [Arguments]    ${name}
    Add Guest    ${name}
    Select Male Gender
    Click Add Guest

Add Female Guest
    [Arguments]    ${name}
    Add Guest    ${name}
    Select Female Gender
    Click Add Guest

Add Neutral Guest
    [Arguments]    ${name}
    Add Guest    ${name}
    Select Neutral Gender
    Click Add Guest

Guest Is In List
    [Arguments]    ${name}
    Wait Until Page Contains    ${name}

Click Invite All
    Click Element    ${BTN_INVITE_ALL}

Invite Message Should Be Visible
    Wait Until Element Is Visible    ${INVITE_MESSAGE}

#TODO: id du remove button
Remove Guest
    [Arguments]    ${name}
    ${guest_xpath}=    Set Variable    xpath=//div[@id="guest-container"]//li[.="${name}"]
    ${remove_button_xpath}=    Set Variable    xpath=${guest_xpath}//button[contains(@class, "remove-btn")]
    Click Element    ${remove_button_xpath}

Add 3 Guests
    [Documentation]    Add 3 guests: gender neutral, male and female
    [Arguments]    ${guest_name1}    ${guest_name2}    ${guest_name3}
    Input Text    ${INPUT_NAME}    ${guest_name1}
    Click Element    ${BTN_ADD}
    Input Text    ${INPUT_NAME}    ${guest_name2}
    Click Element    ${RADIO_MALE}
    Click Element    ${BTN_ADD}
    Input Text    ${INPUT_NAME}    ${guest_name3}
    Click Element    ${RADIO_FEMALE}
    Click Element    ${BTN_ADD}

Check 3 Guests List
    [Arguments]    ${guest_name1}    ${guest_name2}    ${guest_name3}
    Guest Is In List    ${guest_name1}
    Guest Is In List    ${guest_name2}
    Guest Is In List    ${guest_name3}