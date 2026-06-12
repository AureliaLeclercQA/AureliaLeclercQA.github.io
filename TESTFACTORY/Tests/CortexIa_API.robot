*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections
Library         OperatingSystem
#Library         FakerLibrary    locale=fr_FR
Library         json

Documentation       Test API CortexIA

#TODO: create file ressource keywords API
#Resource            %{PROJECT_FOLDER}/Tests/KeywordsAPI/keywords_API.resource

# documentation API
# https://capgemini.sharepoint.com/:w:/r/sites/InnovationSogetiFrance/_layouts/15/Doc2.aspx?action=edit&sourcedoc=%7B6b658220-f0c1-44cf-bc68-0412002eb0c0%7D&wdOrigin=TEAMS-MAGLEV.teamsSdk_ns.rwc&wdExp=TEAMS-TREATMENT&wdhostclicktime=1717399735598&web=1

*** Variables ***
${BASE_URL}     https://cortexia.innovation-factory.io
${USER}    vp006
${PWD}    mdp    #TODO: non sécurisé: pas de mdp en dur + anciennes regles de gestions: utiliser bientot un autre compte test


#robot --outputdir output --variable BROWSER:firefox .\Tests\CortexIa_API.robot

*** Test Cases ***

TC01 Get Account Token
    [Documentation]    This TC use the connection to registered account to reccord the token.
    [Tags]    TC01    passing test case    in_dev
    Log To Console    \n********************\nPOST /api/v1/login
    #${response}    RequestsLibrary.POST
    #...    ${BASE_URL}/api/v1/login?username\=${USER}&password\=${PWD}
    #...    expected_status=200
    ${response}=    RequestsLibrary.POST    ${BASE_URL}/api/v1/login    data={"username": "${USER}", "password": "${PWD}"}    expected_status=200

    ${jsonData}    Set Variable    ${response.json()}
    Set Global Variable    ${TokenAccount}    ${jsonData}[token]
    Log To Console    \nTOKEN ADMIN=\n${TokenAccount}