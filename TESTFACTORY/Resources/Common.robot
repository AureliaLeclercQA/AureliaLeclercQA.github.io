*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn    


*** Variables ***
${BROWSER}        chrome
${PORTFOLIO_URL}  https://aurelialeclercqa.github.io/
${RESULTS_DIR} =    /TESTFACTORY/Results

*** Keywords ***
Custom Screenshot
    ${time}=    Get Time    epoch
    Capture Page Screenshot    screenshot/screenshot_${time}.png

Setup Selenium
    Register Keyword To Run On Failure    Custom Screenshot
    
Open Portfolio
    Open Browser    ${PORTFOLIO_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    Aurelia Leclerc QA    timeout=10s

Verify Portfolio Loaded
    Location Should Be    ${PORTFOLIO_URL}

Begin Web Test
    Setup Selenium
    Open Portfolio
    Verify Portfolio Loaded
    Log    Browser: ${BROWSER} 
    Log    Url: ${PORTFOLIO_URL}

End Web Test
    Close Browser


