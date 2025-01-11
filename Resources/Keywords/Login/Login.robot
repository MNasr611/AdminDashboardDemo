*** Settings ***
Resource    ../../Commons/Commons.robot


*** Variables ***
${txtUsername}      id=username
${txtPassword}      id=password
${loginBtn}         xpath=//button[contains(text(),'Login')]


*** Keywords ***


Validate That Login Page Opened
    Wait Until Page Contains Element    ${loginBtn}
Insert Username
    [Arguments]    ${username}
    Input Text    ${txtUsername}    ${username}

Insert PWD
    [Arguments]    ${password}
    Input Text    ${txtPassword}    ${password}




Click Login
    Click Element    ${loginBtn}


Login
    [Arguments]    ${username}    ${password}
    Insert Username    ${username}
    Insert PWD    ${password}
    Click Login    