*** Settings ***
Documentation    A test suite with a multiple test for validating login functions
...
...              This test follows the example using keywords from
...              the SeleniumLibrary
Resource         resources.robot

*** Test Cases *** ***
Add and Delete User
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1
    Input Text    xpath://*[@id="login-page"]/div/input[1]   admin123
    Input Password    xpath://*[@id="login-page"]/div/input[2]    password
    Submit Credentials
    Page Should Contain    Accounts
    # already logged in / add account
    Click Button    xpath://*[@id="users-page"]/div/div[1]/button
    Input Text    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[2]/input    Selenium_test
    # add 
    Click Button    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[3]/button[2]
    # close
    Click Button    xpath=/html/body/div[3]/div/div[2]/div/div[2]/div/div/div[2]/button
    # delete button / trash can
    Click Button    xpath://*[@id="users-page"]/table/tbody/tr[5]/td[3]/button[2]
    # ok
    Click Button    css=.ant-modal-confirm-btns > .ant-btn-primary    #cant be found ;-;
    # ok
    #Click Button    xpath=//span[contains(.,'OK')]
    #Click Button    ant-btn ant-btn-primary
    # ok
    Click Button    css=.ant-modal-confirm-btns > .ant-btn-primary
    Page Should Not Contain    Selenium_test
    [Teardown]    Close Browser

Add not unique
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1
    Input Text    xpath://*[@id="login-page"]/div/input[1]   admin123
    Input Password    xpath://*[@id="login-page"]/div/input[2]    password
    Submit Credentials
    Page Should Contain    Accounts
    # already logged in / add account
    Click Button    xpath://*[@id="users-page"]/div/div[1]/button
    Input Text    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[2]/input    admin123
    # add 
    Click Button    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[3]/button[2]
    # close
    Page Should Contain    Username already exists
    
    [Teardown]    Close Browser

Add empty field
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1
    Input Text    xpath://*[@id="login-page"]/div/input[1]   admin123
    Input Password    xpath://*[@id="login-page"]/div/input[2]    password
    Submit Credentials
    Page Should Contain    Accounts
    # already logged in / add account
    Click Button    xpath://*[@id="users-page"]/div/div[1]/button
    # add 
    Click Button    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[3]/button[2]
    # close
    Page Should Contain    Username cannot be empty
    [Teardown]    Close Browser

Add username with less than 6 characters
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1
    Input Text    xpath://*[@id="login-page"]/div/input[1]   admin123
    Input Password    xpath://*[@id="login-page"]/div/input[2]    password
    Submit Credentials
    Page Should Contain    Accounts
    # already logged in / add account
    Click Button    xpath://*[@id="users-page"]/div/div[1]/button
    #username
    Input Text    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[2]/input    test
    # add 
    Click Button    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[3]/button[2]
    # close
    Page Should Contain    Username has to be at least 6 characters
    [Teardown]    Close Browser

Add username with greater than 30 characters
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1
    Input Text    xpath://*[@id="login-page"]/div/input[1]   admin123
    Input Password    xpath://*[@id="login-page"]/div/input[2]    password
    Submit Credentials
    Page Should Contain    Accounts
    # already logged in / add account
    Click Button    xpath://*[@id="users-page"]/div/div[1]/button
    #username
    Input Text    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[2]/input    1234567890123456789012345678901
    # add 
    Click Button    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[3]/button[2]
    # close
    Page Should Contain    Username has to be atmost 30 characters
    [Teardown]    Close Browser