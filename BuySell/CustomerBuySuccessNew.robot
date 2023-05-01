*** Settings ***
Library    Selenium2Library
Suite Setup    Suite Setup
Library     RequestsLibrary
Library     Collections
Library     String
Library    HttpLibrary.HTTP 
***Suite Teardown  Close Browser

*** Variables ***
${browser}     chrome
${urlJedi}    #
${urlApiOTP}    #/jedi/api/v1
${pathImage}   D:/WorkKTB/JEDIRobotTest/image
${username}    #
${password}    #
${locatorDDL}   xpath://*[@id="buy"]/form/div[1]/div[2]/select
${select value ddl}    OCT
${locatorTxtinput}   xpath://*[@id="buy"]/form/div[2]/div[2]/input
${locatorTxtRefcode}   xpath://*[@id="refCodeOTP"]
${locatorTxtOTP}   xpath://*[@id="OTPVerify"]
${locatorVerify}  xpath:/html/body/div/div/div[3]/button[1]
${locatorฺฺButtonBuy}   xpath://*[@id="buy"]/form/div[6]/button[1]
${locatorฺฺAlertSuccess}   xpath:/html/body/div/div/div[3]/button[1]
${token}    Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTIwMDU3MTQsInNvdXJjZSI6IlNtYXJ0RlgiLCJzeXN0ZW0iOiJKRURJIiwidXNlcm5hbWUiOiJhZG1pbiJ9.uLUslBHjGWkWroV5JdFh57Z5EqZZTEoTri9ixivJIYk

*** Test Cases ***
Login case
    Buy Future

*** Keywords ***
Suite Setup
   Open Browser  ${urlJedi}  ${browser}
   Set Screenshot Directory  ${pathImage}

Buy Future
    Input Text       id=txtUsername    ${username}
    Input Password   id=txtPassword    ${password}
    Click Button     id=btnLogin
    Wait Until Element Is Visible  ${locatorDDL}    30s
    Select From List By Label   ${locatorDDL}  ${select value ddl}
    Input Text       ${locatorTxtinput}   1
    Click Element     ${locatorฺฺButtonBuy}
    wait until page contains element  ${locatorTxtRefcode}         30s
    ${refCode}=    Get Text    ${locatorTxtRefcode} 
    ${refCodeOTPOnly}=    Get Substring  ${refCode}   10    
    Log    Num value is ${refCodeOTPOnly}
    ${json_string}=    catenate
    ...  {
    ...    "refCode": \"${refCodeOTPOnly}\"
    ...  }
    &{headers}=    Create Dictionary    Content-Type=application/json   Authorization=${token}
    Create Session  tmd   ${urlApiOTP}
    ${resp}=    POST Request    tmd    admin/future/getotp    data=${json_string}    headers=${headers}
    Log    Num value is ${resp.text}
    Should Be Equal  ${resp.status_code}  ${200}
    ${json} =  Set Variable  ${resp.json()}
    Log    Num value is ${json['otp']}
    Input Text       ${locatorTxtOTP}    ${json['otp']}
    Wait Until Page Contains Element   ${locatorVerify}   30s
    Click Element    ${locatorVerify}
    Wait Until Page Contains      Success        30s
    Wait Until Page Contains Element   ${locatorฺฺAlertSuccess}   30s
    Click Element    ${locatorฺฺAlertSuccess}
    
  