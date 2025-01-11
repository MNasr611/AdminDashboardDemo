*** Settings ***
Resource    ../../Commons/Commons.robot


*** Variables ***
${2faLabel}      xpath=//label[contains(@for,'authCode')]
${skip2faBtn}    xpath=//button[contains(text(),'Skip')]
*** Keywords ***


Validate That 2FA Page Opened
    Wait Until Page Contains Element    ${2faLabel}



Skip 2FA
    Click Element    ${skip2faBtn}    