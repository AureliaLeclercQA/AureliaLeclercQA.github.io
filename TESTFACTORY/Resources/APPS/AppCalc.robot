*** Settings ***
Library  SeleniumLibrary

*** Variables ***
#${PORTFOLIO_URL}  https://aurelialeclercqa.github.io/

${APP_CALC}       xpath=//div[@id="app_calc"]

*** Keywords ***
Go To App Calc
    Click Element    ${APP_CALC}
    Wait Until Page Contains   Calculatrice    timeout=5s

Verify App Calc Loaded
    Location Should Be    https://aurelialeclercqa.github.io/pages/calc.html

