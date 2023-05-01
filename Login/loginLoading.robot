*** Settings ***
Library    Selenium2Library
Suite Setup    Suite Setup     
**Suite Teardown  Close Browser

*** Variables ***
${browser}     chrome
${url}    #
${Path}   D:/WorkKTB/JEDIRobotTest/image

*** Test Cases ***
Login case    
    Login time time loading have trade

*** Keywords ***
Suite Setup
   Open Browser  ${url}  ${browser}
   Set Screenshot Directory  ${Path}

Login time time loading not trade
    Input Text       id=txtUsername    customer005
    Input Password   id=txtPassword    password
    Click Button     id=btnLogin
    Wait Until Page Contains     To be continue at 08:30 AM - 10:40 AM 
    Wait Until Page Does Not Contain      FCD account in place (KTB)
    Click Element    xpath=//*[@id="bd-versions"]/span     # click name before logout
    Click Element    xpath=/html/body/app-root/app-customer-master-page/nav/div/div[1]/ul/li/div/a/i      # click logout
    Click Element    xpath=/html/body/div/div/div[3]/button[1]       # click button ok
    Capture Page Screenshot    Login_username_and_password_role_customer_have_trade.png      
     
Login time time loading have trade
    Input Text       id=txtUsername    customer005
    Input Password   id=txtPassword    password
    Click Button     id=btnLogin
    Wait Until Page Contains      FCD account in place (KTB)
    Wait Until Page Does Not Contain Element   xpath=/html/body/app-root/app-customer-master-page/app-customer-execute-landing/main/div[2]/div/form/div[9]/button[1]     #  not show button cancel
    Click Element    xpath=//*[@id="bd-versions"]/span    # click name before logout
    Click Element    xpath=/html/body/app-root/app-customer-master-page/nav/div/div[1]/ul/li/div/a/i       # click logout
    Click Element    xpath=/html/body/div/div/div[3]/button[1]    # click button ok
    Capture Page Screenshot    Login_username_and_password_role_customer_have_trade.png    