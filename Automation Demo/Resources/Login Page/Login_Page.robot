*** Settings ***
Resource    ../../Resources/Generic.robot


*** Variables ***
${UserNameLocator}    xpath://input[@id="user-name"]
${PasswordLocator}    xpath://input[@id='password']
${LoginButtomLocator}    xpath://input[@id='login-button']

${url}    https://www.saucedemo.com/v1/
${userName}    standard_user
${Password}    secret_sauce
${Browser}    chrome
${match_url}    https://www.saucedemo.com/v1/inventory.html

*** Keywords ***
Login_to_application
    [Arguments]    ${url}    ${UserName}   ${Password}
   # Go To    url
    Input Text    ${UserNameLocator}    text=${UserName}
    Input Text    ${PasswordLocator}    text=${Password}
    Click Button    ${LoginButtomLocator}


Login_to_the_Application_with_valid_credentials
    Open Browser    ${Url}    ${Browser}
    Login_to_application    ${url}    ${userName}    ${Password}
    ${url_location}=    Get Location
    Log    ${url_location}
    Should Be Equal    ${url_location}    ${match_url}    