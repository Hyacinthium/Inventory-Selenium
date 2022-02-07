*** Settings ***
Documentation    A test suite with a multiple test for product functions
...
...              This test follows the example using keywords from
...              the SeleniumLibrary
Resource         resources.robot

*** Test Cases *** ***

Add product
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1
    Input Text    xpath://*[@id="login-page"]/div/input[1]   admin123
    Input Password    xpath://*[@id="login-page"]/div/input[2]    password
    Submit Credentials
    Page Should Contain    Accounts
    #Should be logged in already
    #go to inventory page
    Click Element   xpath://*[@id="navbar"]/div[2]/a[2]
    #clicks add button
    Click Button    xpath://*[@id="admin-inventory"]/div/div[1]/button[2]
    Input Text    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[2]/input[1]  Selenium_prod
    #erases the leading 1
    Clear Element Text    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/input  
    Input Text    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div[1]/div[1]/div/div[2]/input    20
    #erases the leading 1
    Clear Element Text    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div/div[2]/input
    Input Text    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[2]/div[1]/div[2]/div/div[2]/input    2000
    Input Text    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[2]/input[2]   Selenium_prod
    Input Text    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[2]/input[3]   Quezon city   
    Click Button    xpath=/html/body/div[2]/div/div[2]/div/div[2]/div[3]/button[2]
    Page Should Contain    Selenium_prod
    [Teardown]    Close Browser
Delete Product
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1
    Input Text    xpath://*[@id="login-page"]/div/input[1]   admin123
    Input Password    xpath://*[@id="login-page"]/div/input[2]    password
    Submit Credentials
    Page Should Contain    Accounts
    #Should be logged in already
    #go to inventory page
    Click Element   xpath://*[@id="navbar"]/div[2]/a[2]
    Click Button    xpath://*[@id="admin-inventory"]/table/tbody/tr[10]/td[7]/button[2]
    Click Button    css=.ant-modal-confirm-btns > .ant-btn-primary
    Page Should Not Contain    Selenium_prod
    [Teardown]    Close Browser




