*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  ../PYTHON/StatsLibrary.py    WITH NAME     StatsLibrary

*** Variables ***
#${PORTFOLIO_URL}  https://aurelialeclercqa.github.io/
${APP_DEDE}      xpath=//div[@id="app_dede"]
${LANCE} =    xpath=//button[@id="rollButton"]
${RESULT} =    xpath=//div[@id="result"]

@{FACES}    1    2    3    4    5    🐷
    

*** Keywords ***
Go To App Dede
    Click Element    ${APP_DEDE}
    Wait Until Page Contains    Le dé de Dédé    timeout=5s

Verify App Dede Loaded
    Location Should Be    https://aurelialeclercqa.github.io/pages/dede.html

Roll Dede
    Click Element    ${LANCE}
    Wait Until Element Is Visible    ${RESULT}    timeout=5s
    ${value}=    Get Text    ${RESULT}
    Return From Keyword    ${value}

Roll Dede N Times
    [Arguments]    ${N}
    @{results}=    Create List

    FOR    ${i}    IN RANGE    ${N}
        ${value}=    Roll Dede
        Append To List    ${results}    ${value}
    END

    RETURN    ${results}


Count Results
    [Arguments]    @{results}
    &{counts}=    Create Dictionary

    # init du dictionnaire
    FOR    ${face}    IN    @{FACES}
        Set To Dictionary    ${counts}    ${face}=0
    END

    # comptage
    FOR    ${r}    IN    @{results}
        ${current}=    Get From Dictionary    ${counts}    ${r}
        ${new}=    Evaluate    ${current} + 1
        Set To Dictionary    ${counts}    ${r}    ${new}
    END

    RETURN    ${counts}

Test Dice
    [Arguments]    ${N}
    @{results}=    Roll Dede N Times    ${N}
    &{counts}=     Count Results    @{results}

    ${chi2}    ${file}=    StatsLibrary.Compute Chi2 And Export    ${counts}

    Log    Chi² = ${chi2}    console=True
    Log    File = ${file}    console=True
    Log    Counts = ${counts}    console=True
    #Log    Results = ${results}    console=True

    IF    ${chi2} < 11.07 #5 degrees of freedom, alpha=0.05 (5%)
        Log    Random OK ✅
    ELSE
        Fail   Not random ❌
    END