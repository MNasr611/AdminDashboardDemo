*** Settings ***
Resource    ../../Resources/Commons/Commons.robot
Suite Setup    Begin Suite
Suite Teardown    End Suite


*** Test Cases ***
Add New Attendee
    [Documentation]    Login to the application
    [Tags]    AddAttendee
    Go To Dashboard
    Validate That Login Page Opened
    Login    
    ...    ${AdminEmail}
    ...    ${AdminPassword}
    Validate That 2FA Page Opened
    Skip 2FA
    Validate That Home Page Opened
    Click On First Event
    Validate That Dashboard Page Opened
    Go To Attendees
    Validate That Attendees Page Opened


    


