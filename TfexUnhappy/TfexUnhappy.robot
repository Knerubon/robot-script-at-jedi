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
#${url}    #
${url}    http://localhost:4200
${Path}   D:\Working\KTB\JEDI-Project\JEDIRobotTest\Images\Tfex
${select value}    Unmatch

${input_user}       id=txtUsername
${input_pass}       id=txtPassword
${btn_login}        id=btnLogin
${username_success}     tfex
${password_success}     password
${msg_start}            Test tfex dowland happy case
${msg_end}              Goodbye!!!

${locatorฺฺButtonSave}   xpath:/html/body/app-root/app-tfex-master-page/app-tfex-home/main/div[2]/div/form/div[3]/button
${locatorฺฺButtonYes}   xpath://*[@id="confirm"]/div/div/div/div/div[2]/button[2]
${locatorฺฺButtonOK}   xpath:/html/body/div/div/div[3]/button[1]

${urlAPI}     #/jedi/api/v1
${pathTfexApprove}      task/blockchain/tfexdecision/approvetradeblockchain
${pathTfexDecline}        task/blockchain/tfexdecision/declinetradeblockchain
${token}    Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTIwMDU3MTQsInNvdXJjZSI6IlNtYXJ0RlgiLCJzeXN0ZW0iOiJKRURJIiwidXNlcm5hbWUiOiJhZG1pbiJ9.uLUslBHjGWkWroV5JdFh57Z5EqZZTEoTri9ixivJIYk
${modeTfexApprove}   TfexApprove
${modeTfexDecline}    TfexDecline

    
*** Keywords ***
Open Browsers
   Open Browser  ${url}  ${browser}
   Log to console  ${msg_start}

Suite Setup
   Set Screenshot Directory  ${Path}

Input Username and Password
    [Arguments]      ${xpath_user}       ${xpath_pass}     ${username}       ${password}
     Element Should Be Visible    ${xpath_user}
     Element Should Be Visible    ${xpath_pass}
     Input Text       ${xpath_user}       ${username}
     Input Text       ${xpath_pass}       ${password}

Click Button Login
    [Arguments]     ${btn}
     Element Should Be Visible      ${btn}
     Click Element      ${btn}

Tfex Save
    [tags]    pass
    Open Browsers
    Input Username and Password    ${input_user}   ${input_pass}   ${username_success}     ${password_success} 
    Click Button Login     ${btn_login}  
    Wait Until Element is Enabled  //*[starts-with(@id, 'idSelect-')]   30s
    @{elements}   Get Webelements    //*[starts-with(@id, 'idSelect-')]
    @{ids}    Evaluate    [elem.get_attribute('id') for elem in $elements]
    Log  ${ids}

    FOR    ${element}    IN    @{ids}
           ${tradeId}     Get Substring  ${element}   9
         Log  ${tradeId}
         Select From List By Label  //*[@id="idSelect-${tradeId}"]   ${select value} 
    END

    Sleep   3s
    Click Element     ${locatorฺฺButtonSave}
    Wait Until Element Is Visible     ${locatorฺฺButtonYes}   timeout=20s
    Sleep   3s
    Click Element     ${locatorฺฺButtonYes}
    Wait Until Page Contains       successful.   30s
    Click Element    ${locatorฺฺButtonOK}

Blockchain TfexApprove
    ${json_string}=    catenate
    ...  {
    ...    "Mode": \"${modeTfexApprove}\",
    ...    "AsOfDate": ""
    ...  }
    &{headers}=    Create Dictionary    Content-Type=application/json   Authorization=${token}
    Create Session  tmd   ${urlAPI}
    ${resp}=    POST Request    tmd    ${pathTfexApprove}    data=${json_string}    headers=${headers}
    Log    Num value is ${resp.text}
    Should Be Equal  ${resp.status_code}  ${200}

Blockchain TfexDecline
    ${json_string}=    catenate
    ...  {
    ...    "Mode": \"${modeTfexDecline}\",
    ...    "AsOfDate": ""
    ...  }
    &{headers}=    Create Dictionary    Content-Type=application/json   Authorization=${token}
    Create Session  tmd   ${urlAPI}
    ${resp}=    POST Request    tmd    ${pathTfexDecline}    data=${json_string}    headers=${headers}
    Log    Num value is ${resp.text}
    Should Be Equal  ${resp.status_code}  ${200}



*** Test Cases ***
Tfex case
    Tfex Save
    Blockchain TfexApprove
    Blockchain TfexDecline




  