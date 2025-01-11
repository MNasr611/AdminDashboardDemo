*** Settings ***
Resource    ../Commons/CommonFiles.robot
Resource    ../Commons/CommonLibraries.robot


*** Keywords ***
Go To Dashboard
    Go To    ${BASE_URL}

Go To Attendees
    Go To    url=${ATTENDEES}
