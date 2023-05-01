*** Settings ***
Library    Selenium2Library
Suite Setup    Suite Setup     
***Suite Teardown  Close Browser

*** Variables ***
${browser}     chrome
${url}    #
${Path}   D:/WorkKTB/JEDIRobotTest/image
${locatorDDL}   xpath://*[@id="buy"]/form/div[1]/div[2]/select
${select value}    OCT
${locatorTxtinput}   xpath://*[@id="buy"]/form/div[2]/div[2]/input
${locatorฺฺButtonBuy}   xpath://*[@id="buy"]/form/div[6]/button[1]
${locatorฺฺAlertSuccess}   xpath:/html/body/div/div/div[3]/button[1]

*** Test Cases ***
Login case
    Buy Future   ${locatorDDL}    ${select value}    ${locatorTxtinput}   ${locatorฺฺButtonBuy}   ${locatorฺฺAlertSuccess} 

*** Keywords ***
Suite Setup
   Open Browser  ${url}  ${browser}
   Set Screenshot Directory  ${Path}

Buy Future
    [Arguments]    ${locatorDDL}      ${select value}     ${locatorTxtinput}   ${locatorฺฺButtonBuy}   ${locatorฺฺAlertSuccess}
    Input Text       id=txtUsername    customer005
    Input Password   id=txtPassword    password
    Click Button     id=btnLogin
    wait until page contains element  ${locatorDDL}    30s
    Select From List By Label   ${locatorDDL}  ${select value}
    Input Text       ${locatorTxtinput}   1
    Click Element     ${locatorฺฺButtonBuy}
    Wait Until Page Contains      Success        30s
    Wait Until Page Contains Element   ${locatorฺฺAlertSuccess}   30s
    Click Element    ${locatorฺฺAlertSuccess}
    
  