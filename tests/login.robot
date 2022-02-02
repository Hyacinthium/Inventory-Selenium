*** Settings ***
Documentation    A test suite with a multiple test for validating login functions
...
...              This test follows the example using keywords from
...              the SeleniumLibrary
Resource         resources.robot

*** Test Cases *** ***
Successful admin log in
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1
    Input Text    xpath://*[@id="login-page"]/div/input[1]   admin123
    Input Password    xpath://*[@id="login-page"]/div/input[2]    password
    #Click Button    xpath://*[@id="login-page"]/div/button
    Submit Credentials
    Page Should Contain    Accounts
    [Teardown]    Close Browser

Successful user log in
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1
    Input Text    xpath://*[@id="login-page"]/div/input[1]   user123
    Input Password    xpath://*[@id="login-page"]/div/input[2]    password
    Submit Credentials
    Page Should Contain    Product Name
    [Teardown]    Close Browser

Wrong Password
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1
    Input Text    xpath://*[@id="login-page"]/div/input[1]   user123
    Input Password    xpath://*[@id="login-page"]/div/input[2]    pass
    Submit Credentials
    Page Should Contain    Invalid username or password
    [Teardown]    Close Browser

Empty Fields
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1
    Submit Credentials
    Page Should Contain    Username is empty
    [Teardown]    Close Browser

Empty Password
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1
    Input Text    xpath://*[@id="login-page"]/div/input[1]   user123
    Submit Credentials
    Page Should Contain    Password is empty
    [Teardown]    Close Browser