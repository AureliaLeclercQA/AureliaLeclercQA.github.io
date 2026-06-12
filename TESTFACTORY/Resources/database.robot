*** Settings ***
Library  DatabaseLibrary

*** Variables ***
${DB_HOST}         localhost
${DB_USER}         your_db_user
${DB_PASSWORD}     your_db_password
${DB_NAME}         your_db_name

## https://capgemini.sharepoint.com/:w:/r/sites/InnovationSogetiFrance/_layouts/15/Doc2.aspx?action=edit&sourcedoc=%7Bd9c08a56-15b7-43dd-8d2a-84d3e6405e5d%7D&wdOrigin=TEAMS-MAGLEV.teamsSdk_ns.rwc&wdExp=TEAMS-TREATMENT&wdhostclicktime=1717405252682&web=1

*** Keywords ***
Connect To Database
    Connect To Database  pymysql  ${DB_HOST}  ${DB_NAME}  ${DB_USER}  ${DB_PASSWORD}

*** Test Cases ***
Verify User Registration In Database
    [Documentation]  Test to verify user registration in the database
    Connect To Database
    ${result}=  Query  SELECT * FROM users WHERE email='test@example.com'
    Should Not Be Empty  ${result}
    Disconnect From Database
