*** Settings ***
Library     SeleniumLibrary
Library     ExcelLibrary
Library     BuiltIn    



*** Variables ***
${START_URL} =      https://cortexia.innovation-factory.io/
${BROWSER}=    chrome    #edge, firefox
#${RESULTS_DIR} =    ./Results
#${HEADLESS}=    ${HEADLESS}

*** Keywords ***
Begin Web Test
    Open Browser   about:blank  ${BROWSER}    alias=main_window
    Maximize Browser Window
    Go To                       ${START_URL}
    Log    Browser: ${BROWSER} 
    Log    Url: ${START_URL}

End Web Test
    Close Browser
