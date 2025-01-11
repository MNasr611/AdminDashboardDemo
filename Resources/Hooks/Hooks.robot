*** Settings ***
Resource        ../Commons/Commons.robot


Variables       ../../TestData/${Environment}/testData.yml
Variables       ../../Urls/${Environment}/urls.yml
Variables       ../../Configs/configs.yml

*** Variables ***
${Environment}                  Testing



*** Keywords ***
Begin Suite
    [Arguments]    ${Alias}=None
    # [Timeout]    10 minutes
    ${desired_capabilities}    Create Desired Cab
    ${chrome_options}    Create Options

    ${MaxRetries}    Convert To Integer    ${MaxRetries}
    FOR    ${counter}    IN RANGE    ${MaxRetries}
        Log    ${counter}
        IF    '${Remote_URL}' != '${EMPTY}'
            ${browserOpened}    Create Remote Chrome Driver    ${chrome_options}    ${desired_capabilities}    ${Alias}
        ELSE
            ${browserOpened}    Create Local Chrome Driver    ${chrome_options}    ${desired_capabilities}    ${Alias}
        END
        IF    '${browserOpened}' == '${True}'    BREAK
        Log To Console    Retrying after interval...
        Sleep    10s
        IF    '${counter}' == '${MaxRetries-${1}}'
            Fail    Cannot Intialize Driver After ${MaxRetries} Times Of Retries
        END
    END

    Log To Console    browserOpened_${browserOpened}
    IF    '${browserOpened}' == '${True}'
        Set Global Variable    ${isBrowserOpened}    ${True}
    END
    Set Selenium Speed    ${SeleniumSpeed}
    Set Selenium Implicit Wait    ${ImplicitWait}s
    Set Selenium Timeout    ${TimeOut}s
    Set Selenium Page Load Timeout    ${PageLoadTimeout}s
    Configure Urls

    # Prepare Test Data
    Log To Console    Running Environment Is : ${Environment}
    ${SeleniumSpeedCheck}    Get Selenium Speed
    ${ImplicitWaitCheck}    Get Selenium Implicit Wait
    ${TimeoutCheck}    Get Selenium Timeout
    Log to console    Speed : ${SeleniumSpeedCheck}
    Log To Console    ipmWait : ${ImplicitWaitCheck}
    Log To Console    TimeOut : ${TimeoutCheck}


End Suite
        Run Keyword And Ignore Error    Close Browser


Configure Urls
    Set Global Variable    ${ATTENDEES}    ${BASE_URL}${ATTENDEES}

