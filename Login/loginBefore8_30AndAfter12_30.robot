*** Settings ***
Library    Selenium2Library
Suite Setup    Suite Setup     
Suite Teardown  Close Browser

*** Variables ***
${browser}     chrome
${url}    #
${Path}   D:/WorkKTB/JEDIRobotTest/image

*** Test Cases ***
Login case
    Login time < 8:30 and > 12.30 have trade
    Login time < 8:30 and > 12.30 have not trade

*** Keywords ***
Suite Setup
   Open Browser  ${url}  ${browser}
   Set Screenshot Directory  ${Path}

Login time < 8:30 and > 12.30 have trade
    Input Text       id=txtUsername    customer005
    Input Password   id=txtPassword    password
    Click Button     id=btnLogin
    Wait Until Page Contains     To be continue tomorrow at 08:30 - 10:40
    Wait Until Page Contains      FCD account in place (KTB)
    Click Element    xpath=//*[@id="bd-versions"]/span      # click name before logout
    Click Element    xpath=/html/body/app-root/app-customer-master-page/nav/div/div[1]/ul/li/div/a/i   # click logout
    Click Element    xpath=/html/body/div/div/div[3]/button[1]      # click button ok
    Capture Page Screenshot    Login_username_and_password_role_customer_have_trade.png    
     
Login time < 8:30 and > 12.30 have not trade
    Input Text       id=txtUsername    customer010
    Input Password   id=txtPassword    password
    Click Button     id=btnLogin
    Wait Until Page Contains     To be continue at 08:30 AM - 10:40 AM 
    Wait Until Page Does Not Contain      FCD account in place (KTB)
    Click Element    xpath=//*[@id="bd-versions"]/span    # click name before logout
    Click Element    xpath=/html/body/app-root/app-customer-master-page/nav/div/div[1]/ul/li/div/a/i      # click logout
    Click Element    xpath=/html/body/div/div/div[3]/button[1]   # click button ok
    Capture Page Screenshot    Login_username_and_password_role_customer_have_trade.png         