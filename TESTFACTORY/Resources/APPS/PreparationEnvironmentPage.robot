*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${my_app_url} =      https://?

### locators 


${locator_button1} =    //input[@id="??"]
${locator_button2} =    //input[@id="??"]
${locator_button3} =    //input[@id="??"]


*** Keywords ***
Verify Page Loaded
    Location Should Be      ${my_app_url}    message = La page de préparation de l'environnement n existe pas

Click Test1
    Click Button    xpath=${locator_button1}
    Sleep    1s
    
Check Test2
    Select Checkbox    xpath=${locator_button1}
    Sleep    1s
