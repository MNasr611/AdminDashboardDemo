*** Settings ***
Resource    ../Commons/Commons.robot
Resource    ../Hooks/Hooks.robot
Library     Collections


*** Keywords ***


Create Remote Chrome Driver
    [Arguments]    ${chrome_options}    ${desired_capabilities}    ${Alias}=None
    ${browserOpened}    Run Keyword And Return Status
    ...    Open Browser
    ...    about:blank
    ...    Chrome
    ...    alias=${Alias}
    ...    remote_url=${Remote_URL}
    ...    options=${chrome_options}
    ...    desired_capabilities=${desired_capabilities}
    [Return]    ${browserOpened}
    


Create Local Chrome Driver
    [Arguments]    ${chrome_options}    ${desired_capabilities}    ${Alias}=None
            ${browserOpened}    Run Keyword And Return Status
            ...    Open Browser
            ...    about:blank
            ...    Chrome
            ...    alias=${Alias}
            ...    options=${chrome_options}
            ...    desired_capabilities=${desired_capabilities}
            [Return]    ${browserOpened}

Create Desired Cab
    ${desired_capabilities}    Evaluate
    ...    sys.modules['selenium.webdriver'].DesiredCapabilities().CHROME
    ...    sys, selenium.webdriver
    ${timeouts}    Evaluate    {}
    Set To Dictionary    ${timeouts}    implicit=${200}
    Set To Dictionary    ${timeouts}    pageLoad=${1}
    Set To Dictionary    ${desired_capabilities}    acceptInsecureCerts    ${True}
    Set To Dictionary    ${desired_capabilities}    timeouts    ${timeouts}
    Set To Dictionary    ${desired_capabilities}    pageLoadStrategy    ${PageLoadStrategy}
    Log    diesired Caps is : ${desired_capabilities}
    RETURN    ${desired_capabilities}

Create Options
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --ignore-ssl-errors
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors-spki-list
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --enable-automation

    IF    '${isHeadless}' == '${True}'
        Call Method    ${chrome_options}    add_argument    --headless
    END
    IF    '${isIncognito}' == '${True}'
        Call Method    ${chrome_options}    add_argument    --incognito
    END

    ${chrome_options.page_load_strategy}    Set Variable    ${PageLoadStrategy}

    RETURN    ${chrome_options}
