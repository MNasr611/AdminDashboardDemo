*** Settings ***
Resource    ../../Commons/Commons.robot


*** Variables ***
${AttendeesHeader}    xpath=//h2[contains(text(),'All Groups')]
${CreateNewGroupButton}    xpath=//span[contains(text(),'Create Group')]


*** Keywords ***
Validate That Attendees Page Opened
    Wait Until Page Contains Element    ${AttendeesHeader}

Click On Create New Group
    Click Element    ${CreateNewGroupButton}

Create New Group
    [Arguments]    ${groupName}
    Click On Create New Group
    Input Text    xpath=//input[@placeholder='Group Name']    ${groupName}
    Click Element    xpath=//button[contains(text(),'Create Group')]



