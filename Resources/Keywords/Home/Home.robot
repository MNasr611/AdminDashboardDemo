*** Settings ***
Resource    ../../Commons/Commons.robot


*** Variables ***
${newEventBtn}    xpath=//a[contains(@href,'/events/options')]
${firstEventRow}    xpath=//tbody//tr[@role='button'][1]

*** Keywords ***
Validate That Home Page Opened
    Wait Until Page Contains Element    ${newEventBtn}



Click On First Event
    Wait Until Keyword Succeeds     
    ...    3x    
    ...    200ms    
    ...    Element Should Be Visible    
    ...    ${firstEventRow}
    Click Element    ${firstEventRow}