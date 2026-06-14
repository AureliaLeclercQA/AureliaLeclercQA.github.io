*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn    


*** Variables ***
${BROWSER}        chrome
${PORTFOLIO_URL}  https://aurelialeclercqa.github.io/
${RESULTS_DIR} =    ./Results

*** Keywords ***

Open Portfolio
    Open Browser    ${PORTFOLIO_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Aurelia Leclerc QA    timeout=10s

Verify Portfolio Loaded
    Location Should Be    ${PORTFOLIO_URL}

Begin Web Test
    Open Portfolio
    Verify Portfolio Loaded
    Log    Browser: ${BROWSER} 
    Log    Url: ${PORTFOLIO_URL}

End Web Test
    Close Browser



