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
    Login username and password role customer 
    Login username and password role broker 
    Login username and password role tfex
    Login username and password role ktb  
    Login username and password role admin  

*** Keywords ***
Suite Setup
   Open Browser  ${url}  ${browser}
   Set Screenshot Directory  ${Path}

Login username and password role customer    
    Input Text       id=txtUsername    customer010
    Input Password   id=txtPassword    password
    Click Button     id=btnLogin
    Wait Until Page Contains     Execute
    Capture Page Screenshot    Login_username_and_password_role_customer.png          
    Click Element    xpath=//*[@id="bd-versions"]/span      # click name before logout
    Click Element    xpath=/html/body/app-root/app-customer-master-page/nav/div/div[1]/ul/li/div/a/i         # click logout
    Click Element    xpath=/html/body/div/div/div[3]/button[1]      # click button ok    
    


Login username and password role broker    
    Input Text       id=txtUsername    broker
    Input Password   id=txtPassword    password
    Click Button     id=btnLogin
    Wait Until Page Contains      Download
    Capture Page Screenshot    Login_username_and_password_role_broker.png            
    Click Element    xpath=//*[@id="bd-versions"]/span     # click name before logout
    Click Element    xpath=/html/body/app-root/app-broker-master-page/nav/div/div[1]/ul/li/div/a/i        # click logout
    Click Element    xpath=/html/body/div/div/div[3]/button[1]        # click button ok 
   

Login username and password role tfex    
    Input Text       id=txtUsername    tfex
    Input Password   id=txtPassword    password
    Click Button     id=btnLogin
    Wait Until Page Contains       approve matching
    Capture Page Screenshot    Login_username_and_password_role_tfex.png             
    Click Element    xpath=//*[@id="bd-versions"]/span      # click name before logout
    Click Element    xpath=/html/body/app-root/app-tfex-master-page/nav/div/div[1]/ul/li/div/a/i       # click logout
    Click Element    xpath=/html/body/div/div/div[3]/button[1]        # click button ok
      

Login username and password role ktb    
    Input Text       id=txtUsername    600283
    Input Password   id=txtPassword    password
    Click Button     id=btnLogin
    Wait Until Page Contains       bid/ask 
    Capture Page Screenshot    Login_username_and_password_role_ktb.png             
    Click Element    xpath=//*[@id="bd-versions"]/span       # click name before logout
    Click Element    xpath=/html/body/app-root/app-ktb-master-page/nav/div/div[1]/ul/li/div/a/i      # click logout
    Click Element    xpath=/html/body/div/div/div[3]/button[1]        # click button ok

Login username and password role admin    
    Input Text       id=txtUsername    adminjedi
    Input Password   id=txtPassword    password
    Click Button     id=btnLogin
    Wait Until Page Contains      Master Config
    Capture Page Screenshot    Login_username_and_password_role_admin.png             
    Click Element    xpath=//*[@id="bd-versions"]/span       # click name before logout
    Click Element    xpath=/html/body/app-root/app-admin-master-page/nav/div/div[1]/ul/li/div/a/i     # click logout
    Click Element    xpath=/html/body/div/div/div[3]/button[1]    # click button ok      