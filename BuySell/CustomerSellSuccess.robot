*** Settings ***
Library    Selenium2Library
Suite Setup    Suite Setup     
***Suite Teardown  Close Browser

*** Variables ***
${browser}     chrome
${url}    #
${Path}   D:/WorkKTB/JEDIRobotTest/image
${TabSell}     xpath://*[@id="pills-profile-tab"]
${locatorDDL}   xpath://*[@id="sell"]/form/div[1]/div[2]/select
${select value}    AUG
${locatorTxtinput}   xpath://*[@id="sell"]/form/div[2]/div[2]/input
${locatorฺฺButtonSell}   xpath://*[@id="sell"]/form/div[6]/button[1]
${locatorฺฺAlertSuccess}   xpath:/html/body/div/div/div[3]/button[1]


*** Test Cases ***
Login case
    Sell Future   ${locatorDDL}    ${select value}    ${locatorTxtinput}   ${locatorฺฺButtonSell}   ${locatorฺฺAlertSuccess} 

*** Keywords ***
Suite Setup
   Open Browser  ${url}  ${browser}
   Set Screenshot Directory  ${Path}

Sell Future
    [Arguments]    ${locatorDDL}      ${select value}     ${locatorTxtinput}    ${locatorฺฺButtonSell}   ${locatorฺฺAlertSuccess} 
    Input Text       id=txtUsername    customer005
    Input Password   id=txtPassword    password
    Click Button     id=btnLogin
    wait until page contains element  ${TabSell}   30s
    Click Element    ${TabSell}
    wait until page contains element  ${locatorDDL}    30s
    Select From List By Label   ${locatorDDL}  ${select value}
    Input Text       ${locatorTxtinput}   1
    Click Element     ${locatorฺฺButtonSell}
    Wait Until Page Contains      Success        30s
    Wait Until Page Contains Element   ${locatorฺฺAlertSuccess}   30s
    Click Element    ${locatorฺฺAlertSuccess}
  