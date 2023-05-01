*** Settings ***
Library    Selenium2Library
Suite Setup    Suite Setup     
***Suite Teardown  Close Browser

*** Variables ***
${browser}     chrome
${url}    #
${Path}   D:/WorkKTB/JEDIRobotTest/image
${liMenu}   xpath:/html/body/app-root/app-ktb-master-page/nav/div/div[3]/ul/li[2]/a
${btnSubmit}   xpath:/html/body/app-root/app-ktb-master-page/app-ktb-approve/main/div[1]/div/form/div[5]/button
${btnConfirm}   xpath://*[@id="confirm"]/div/div/div/div/div[2]/button[2]
${btnSuccess}   xpath:/html/body/div/div/div[3]/button[1]
${locatorTable}    xpath=//*[@id="trade_list"]

*** Test Cases ***
Login case
    Ktbtrader Settlement

*** Keywords ***
Suite Setup
   Open Browser  ${url}  ${browser}
   Set Screenshot Directory  ${Path}

Ktbtrader Settlement
    Input Text       id=txtUsername    #
    Input Password   id=txtPassword    #
    Click Button     id=btnLogin
    Wait Until Element Is Visible  ${liMenu}    30s 
    Click Element     ${liMenu}
    wait until page contains element  ${btnSubmit}    30s   
    Click Button     ${btnSubmit}
    Sleep    1s
    Wait Until Element Is Visible  ${btnConfirm}    30s
    Sleep    1s
    Click Button        ${btnConfirm}
    Sleep    1s
    Wait Until Element Is Visible  ${btnSuccess}    30s
    Sleep    1s
    Click Element        ${btnSuccess}
    Sleep    1s
    Wait Until Element Is Visible  ${locatorTable}    30s
    ${rowcnt} =    Get Element Count   ${locatorTable}/tbody/tr
     Log    Num value is ${rowcnt + 2}
    : FOR    ${x}    IN RANGE    2    ${rowcnt + 2}
    \    ${item1}    Get Table Cell   ${locatorTable}  ${x}   11
    \    Log    Num value is ${item1}
     
  