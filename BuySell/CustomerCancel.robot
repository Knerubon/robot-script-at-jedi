*** Settings ***
Library    Selenium2Library
Suite Setup    Suite Setup     
***Suite Teardown  Close Browser

*** Variables ***
${browser}     chrome
${url}    #
${Path}   D:/WorkKTB/JEDIRobotTest/image
${locatorฺฺButtonCancel}   xpath:/html/body/app-root/app-customer-master-page/app-customer-execute-landing/main/div[2]/div/form/div[9]/button[1]
${locatorฺฺAlertSuccess}   xpath:/html/body/div/div/div[3]/button[1]


*** Test Cases ***
Login case
    Cancel Future   ${locatorฺฺButtonCancel}   ${locatorฺฺAlertSuccess}

*** Keywords ***
Suite Setup
   Open Browser  ${url}  ${browser}
   Set Screenshot Directory  ${Path}

Cancel Future
    [Arguments]    ${locatorฺฺButtonCancel}     ${locatorฺฺAlertSuccess}
    Input Text       id=txtUsername    customer005
    Input Password   id=txtPassword    password
    Click Button     id=btnLogin
    Wait Until Page Contains      Estimated futures rate        30s
    Click Element    ${locatorฺฺButtonCancel}
    Click Button     id=btnyes
     Wait Until Page Contains Element   ${locatorฺฺAlertSuccess}   30s
    Click Element    ${locatorฺฺAlertSuccess}