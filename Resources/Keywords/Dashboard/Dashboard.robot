*** Settings ***
Resource    ../../Commons/Commons.robot


*** Variables ***
${DashboardHeader}    xpath=//h2[contains(text(),'Dashboard')]
${sideBarRegestration}    xpath=//aside[contains(@class,'aside')]//span[contains(text(),'Registration')]


*** Keywords ***
Validate That Dashboard Page Opened
    Wait Until Page Contains Element    ${DashboardHeader}
