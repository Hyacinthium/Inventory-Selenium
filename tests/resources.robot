*** Settings ***
Documentation    A resource file with reusable keywords and variables
...
...              Creating system specific keywords from default keywords
...              from SeleniumLibrary
Library          SeleniumLibrary

*** Variables ***
#${SERVER}             www.saucedemo.com
${BROWSER}            chrome
${DELAY}              1
${VALID USER}         leana_user
${ADMIN USER}         leana_admin
${VALID PASSWORD}     password
${LOGIN URL}          https://office-supplies-inventory-app.herokuapp.com/
#${HOME URL}           https://${SERVER}/inventory.html
#${INVALID PASSWORD}   123456

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Element    button

Product Page Should Be Open
    Element Text Should Be    class:title    PRODUCTS

Wrong Password Message
    Element Text Should Be    class:title    PRODUCT

Input Username
    [Arguments]    ${username}
    Input Text    user-name    ${username}

Input Pass
    [Arguments]    ${password}
    Input Password    password    ${password}

Submit Credentials
    Click Button    xpath://*[@id="login-page"]/div/button
