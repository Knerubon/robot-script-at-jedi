*** Settings ***
Library    Selenium2Library
Suite Setup    Suite Setup     
***Suite Teardown  Close Browser

*** Variables ***
${browser}     chrome
${url}    #
${Path}   D:/WorkKTB/JEDIRobotTest/image

*** Test Cases ***
Login case
   No Username and No Password
   Login Username Other (no register) and Password
   Login Username and Password incorrect

*** Keywords ***
Suite Setup
   Open Browser  ${url}  ${browser}
   Set Screenshot Directory  ${Path}

No Username and No Password    
    Click Button     id=btnLogin
    Wait Until Page Contains    Username is required  30s   
    Wait Until Page Contains    Password is required  30s 
    Capture Page Screenshot    login_No_Username_and_No_Password.png
    
Login Username Other (no register) and Password
    Input Text       id=txtUsername    customer022
    Input Password   id=txtPassword    password
    Click Button     id=btnLogin
    Wait Until Page Contains    Username not register in JEDI system  30s  
    Capture Page Screenshot    Login_Username_Other_no_register_and_Password.png    
    Click Element    xpath=/html/body/div/div/div[3]/button[1]      # click button ok 

Login Username and Password incorrect
    Input Text       id=txtUsername    customer002
    Input Password   id=txtPassword    password1
    Click Button     id=btnLogin
    Wait Until Page Contains    Password is incorrect  30s  
    Capture Page Screenshot    Login_Username_and_Password_incorrect.png
    Click Element    xpath=/html/body/div/div/div[3]/button[1]     # click button ok 

    