*** Settings ***
Resource    ../../Resources/Commons/Commons.robot
Resource    ../../Resources/Keywords/Home/Home.robot
Suite Setup    Begin Suite
Suite Teardown    End Suite



*** Test Cases ***
Login To The Application
    [Documentation]    Login to the application
    [Tags]    Login
    Go To Dashboard
    Validate That Login Page Opened
    Login    
    ...    ${AdminEmail}
    ...    ${AdminPassword}
    Validate That 2FA Page Opened
    Skip 2FA
    Validate That Home Page Opened



