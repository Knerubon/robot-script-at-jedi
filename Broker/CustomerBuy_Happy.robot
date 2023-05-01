*** Settings ***
Library     Selenium2Library
Library     RequestsLibrary
Library     Collections
Library     String
Library     HttpLibrary.HTTP
Suite Setup    Suite Setup  
#Suite Teardown  Suite Teardown

*** Variables ***
#${MESSAGE_start}     --------------------------------- Start ----------------------------------------
${browser}      chrome
#${url}          https://www.gme.ktb.co.th/jedi/login
${url}          #/jedi/login
#${url_BUY}      https://www.gme.ktb.co.th/jedi/customerexecutebuy
${url_BUY}      #/jedi/customerexecutebuy
${Path}          D:/JEDI/Robot/HappyCase/image
${title_JEDI}       J E D I : Joint Exchange Development Initiative
${input_user}       id=txtUsername
${input_pass}       id=txtPassword
${btn_login}        id=btnLogin
## BUY ##
${inputDDL_CTMonth}     xpath=//*[@id="buy"]/form/div[1]/div[2]/select
${input_Amount}         xpath://*[@id="buy"]/form/div[2]/div[2]/input
${btn_Buy}              xpath://*[@id="buy"]/form/div[6]/button[1]
${locatorAlertSuccess}  xpath:/html/body/div/div/div[3]/button[1]
${Contract_Month}       OCT
${Contract_Amount}      1
## cancel ##
${btn_cancel}      xpath=/html/body/app-root/app-customer-master-page/app-customer-execute-landing/main/div[2]/div/form/div[9]/button[1]
${btn_cancel_Y}       xpath=//*[@id="btnyes"]
${btn_cancel_OK}         xpath=/html/body/div/div/div[3]/button[1]
## OTP ##
${urlApiOTP}    #/jedi/api/v1
${locatorTxtRefcode}    xpath://*[@id="refCodeOTP"]
${token}     Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTIwMDU3MTQsInNvdXJjZSI6IlNtYXJ0RlgiLCJzeXN0ZW0iOiJKRURJIiwidXNlcm5hbWUiOiJhZG1pbiJ9.uLUslBHjGWkWroV5JdFh57Z5EqZZTEoTri9ixivJIYk
${locatorTxtOTP}   xpath://*[@id="OTPVerify"]
${locatorVerify}   xpath:/html/body/div/div/div[3]/button[1]
## CreateAndHoldCash ##
${urlApiHoldCash}     #/jedi/api/v1
${pathCreateBlockChain}      task/blockchain/create/createtradeblockchain
${pathPermanentHold}        task/permanent/PermanentHold
#${token}    Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTIwMDU3MTQsInNvdXJjZSI6IlNtYXJ0RlgiLCJzeXN0ZW0iOiJKRURJIiwidXNlcm5hbWUiOiJhZG1pbiJ9.uLUslBHjGWkWroV5JdFh57Z5EqZZTEoTri9ixivJIYk
${modeBlockChain}   Create
${modePermanent}    PermanentHold
## Broker Approve
${locatorButtonDownland}   xpath://*[@id="downloadCsvAll"]
${btn_Success}    xpath=/html/body/div/div/div[3]/button[1]
${title}   xpath=/html/body/app-root/app-broker-master-page/app-broker-home/main/div[2]/h1
## TFEX TfexDecision
${select value}    Match
${locatorButtonSave}   xpath:/html/body/app-root/app-tfex-master-page/app-tfex-home/main/div[2]/div/form/div[3]/button
${locatorButtonYes}   xpath://*[@id="confirm"]/div/div/div/div/div[2]/button[2]
${locatorButtonOK}   xpath:/html/body/div/div/div[3]/button[1]
${urlAPI}     #/jedi/api/v1
${pathTfexApprove}      task/blockchain/tfexdecision/approvetradeblockchain
${pathTfexDecline}        task/blockchain/tfexdecision/declinetradeblockchain
${token}    Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTIwMDU3MTQsInNvdXJjZSI6IlNtYXJ0RlgiLCJzeXN0ZW0iOiJKRURJIiwidXNlcm5hbWUiOiJhZG1pbiJ9.uLUslBHjGWkWroV5JdFh57Z5EqZZTEoTri9ixivJIYk
${modeTfexApprove}   TfexApprove
${modeTfexDecline}    TfexDecline
## DeclineAndUnholdCash ##
${urlBrokerdecision}     #/jedi/api/v1
${urlPermanent}         #/jedi/api/v1
${pathDeclineBlockChain}      task/blockchain/brokerdecision/declinetradeblockchain
${pathApproveBlockChain}      task/blockchain/brokerdecision/approvetradeblockchain
${pathPermanentUnHold}        task/permanent/PermanentUnHold
#${pathImage}   C:/ProjectKTB/JEDIRobotTest/image/broker
#${token}    Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTIwMDU3MTQsInNvdXJjZSI6IlNtYXJ0RlgiLCJzeXN0ZW0iOiJKRURJIiwidXNlcm5hbWUiOiJhZG1pbiJ9.uLUslBHjGWkWroV5JdFh57Z5EqZZTEoTri9ixivJIYk
${modeBlockChainBrokerApprove}   BrokerApprove
${modeBlockChainBrokerDecline}   BrokerDecline
${modePermanentUnHold}    PermanentUnHold
#KTB
${liMenu}   xpath:/html/body/app-root/app-ktb-master-page/nav/div/div[3]/ul/li[2]/a
${btnSubmit}   xpath:/html/body/app-root/app-ktb-master-page/app-ktb-approve/main/div[1]/div/form/div[5]/button
${btnConfirm}   xpath://*[@id="confirm"]/div/div/div/div/div[2]/button[2]
${btnSuccess}   xpath:/html/body/div/div/div[3]/button[1]
${locatorTable}    xpath=//*[@id="trade_list"]
#${MESSAGE_end}       --------------------------------- End ----------------------------------------

*** Keywords ***
Suite Setup 
    Open Browser  ${url}  ${browser}
    Set Screenshot Directory  ${Path}
    #Log to console  ${MESSAGE_start}
    # Input Text       ${input_user}        ${username_success}
    # Input Text       ${input_pass}        ${password_success}
    # Click Element     ${btn_login}
    # Sleep   1s
login JEDI
    [Arguments]    ${xpath_user}    ${xpath_pass}    ${username}    ${password} 
     Element Should Be Visible    ${xpath_user}
     Element Should Be Visible    ${xpath_pass}
     Input Text       ${xpath_user}       ${username}
     Input Text       ${xpath_pass}       ${password}
     Click Element    ${btn_login}
     Sleep   2s     
Logout JEDI
     Click Element    xpath=//*[@id="bd-versions"]
     Sleep   1s       
     Click Element    xpath=/html/body/app-root/app-customer-master-page/nav/div/div[1]/ul/li/div/a
     Sleep   1s
     Click Element    xpath=/html/body/div/div/div[3]/button[1]
     Sleep   1s
Click Logout JEDI
    [Arguments]     ${btn}
     Element Should Be Visible      ${btn}
     Click Element      ${btn}
Suite Teardown
    Close Browser
    #Log to console  ${MESSAGE_end}
Buy Future
    [Arguments]      ${xpath_CTMonth}       ${xpath_CTAmount}     ${CTMonth}       ${CTAmount}
     Sleep   2s
     Select From List By Label       ${xpath_CTMonth}       ${CTMonth}
     Input Text       ${xpath_CTAmount}       ${CTAmount}
     Sleep   3s
     Click Element        ${btn_Buy}
Get OTP
    Sleep   2s
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
    Wait Until Page Contains Element   ${locatorAlertSuccess}   30s
    Click Element    ${locatorAlertSuccess}
    Sleep   2s

Create blockchain
    ${json_string}=    catenate
    ...  {
    ...    "Mode": \"${modeBlockChain}\",
    ...    "AsOfDate": ""
    ...  }
    &{headers}=    Create Dictionary    Content-Type=application/json   Authorization=${token}
    Create Session  tmd   ${urlApiHoldCash}
    ${resp}=    POST Request    tmd    ${pathCreateBlockChain}    data=${json_string}    headers=${headers}
    Log    Num value is ${resp.text}
    Should Be Equal  ${resp.status_code}  ${200}

Hold Cash
     ${json_string}=    catenate
    ...  {
    ...    "Mode": \"${modePermanent}\",
    ...    "AsOfDate": ""
    ...  }
    &{headers}=    Create Dictionary    Content-Type=application/json   Authorization=${token}
    Create Session  tmd   ${urlApiHoldCash}
    ${resp}=    POST Request    tmd    ${pathPermanentHold}    data=${json_string}    headers=${headers}
    Log    Num value is ${resp.text}
    Should Be Equal  ${resp.status_code}  ${200}   
Approve blockchain
    ${json_string}=    catenate
    ...  {
    ...    "Mode": \"${modeBlockChainBrokerApprove}\",
    ...    "AsOfDate": ""
    ...  }
    &{headers}=    Create Dictionary    Content-Type=application/json   Authorization=${token}
    #Log  ${urlBrokerdecision}
    Create Session  tmd   ${urlBrokerdecision}

    ${resp}=    POST Request    tmd    ${pathApproveBlockChain}    data=${json_string}    headers=${headers}
    Log    Num value is ${resp.text}
    Should Be Equal  ${resp.status_code}  ${200}


Decline blockchain
    ${json_string}=    catenate
    ...  {
    ...    "Mode": \"${modeBlockChainBrokerDecline}\",
    ...    "AsOfDate": ""
    ...  }
    &{headers}=    Create Dictionary    Content-Type=application/json   Authorization=${token}
    Create Session  tmd   ${urlPermanent}
    ${resp}=    POST Request    tmd    ${pathDeclineBlockChain}    data=${json_string}    headers=${headers}
    Log    Num value is ${resp.text}
    Should Be Equal  ${resp.status_code}  ${200}


UnHold Cash
     ${json_string}=    catenate
    ...  {
    ...    "Mode": \"${modePermanentUnHold}\",
    ...    "AsOfDate": ""
    ...  }
    &{headers}=    Create Dictionary    Content-Type=application/json   Authorization=${token}
    Create Session  tmd   ${urlPermanent}
    ${resp}=    POST Request    tmd    ${pathPermanentUnHold}    data=${json_string}    headers=${headers}
    Log    Num value is ${resp.text}
    Should Be Equal  ${resp.status_code}  ${200}   
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
Step : Customer BUY
    login JEDI    ${input_user}    ${input_pass}     customer007     P@ssw0rd
    Location Should Be  ${url_BUY}
    Buy Future   ${inputDDL_CTMonth}    ${input_Amount}   ${Contract_Month}   ${Contract_Amount}
    Get OTP
    Sleep   2s
    ${gettext}    Get Text    xpath=/html/body/app-root/app-customer-master-page/app-customer-execute-landing/main/div[2]/div/form/div[1]/div[2]/div[2]
    Log     ${gettext}
    Should Be True      '${gettext}' == 'Approved'   msg=None
    Sleep   1s
    Wait Until Page Contains          Buying Detail   40s
    Sleep   1s
    Capture Page Screenshot    1.Customer BUY-{index}.png
    Logout JEDI
Step : Run Job Create And HoldCash
    Sleep   2s
    Create blockchain
    Hold Cash
Step : Broker Approve
    login JEDI    ${input_user}    ${input_pass}     broker       password
    Sleep   1s
    wait until element is enabled  //*[starts-with(@id, 'idSelect-')]   30s
    @{elements}   Get Webelements    //*[starts-with(@id, 'idSelect-')]
    @{ids}    Evaluate    [elem.get_attribute('id') for elem in $elements]
    Log  ${ids}

    FOR    ${element}    IN    @{ids}
           ${tradeId}     Get Substring  ${element}   9
         Log  ${tradeId}
         Select From List By Label  //*[@id="idSelect-${tradeId}"]   Approve 
    END

   Sleep   2s
   Click Element     ${locatorButtonDownland}
   Sleep   1s
   Click Element    ${btn_Success}
   Sleep   2s
   Capture Page Screenshot  2.Broker Approve-{index}.png 
   Click Element    xpath=//*[@id="bd-versions"]
   Click Element    xpath=/html/body/app-root/app-broker-master-page/nav/div/div[1]/ul/li/div/a
   Click Element    xpath=/html/body/div/div/div[3]/button[1]
     
Step : Run Job Decline And UnholdCash
    Sleep   2s
    Approve blockchain
    Decline blockchain
    UnHold Cash
Step : TFEX Match
    login JEDI    ${input_user}    ${input_pass}     TFEX     password
    Sleep   2s
    Wait Until Element is Enabled  //*[starts-with(@id, 'idSelect-')]   30s
    @{elements}   Get Webelements    //*[starts-with(@id, 'idSelect-')]
    @{ids}    Evaluate    [elem.get_attribute('id') for elem in $elements]
    Log  ${ids}

    FOR    ${element}    IN    @{ids}
           ${tradeId}     Get Substring  ${element}   9
         Log  ${tradeId}
         Select From List By Label  //*[@id="idSelect-${tradeId}"]   ${select value} 
    END

    Sleep   1s
    Click Element     ${locatorButtonSave}
    Wait Until Element Is Visible     ${locatorButtonYes}   timeout=20s
    Sleep   1s
    Click Element     ${locatorButtonYes}
    Wait Until Page Contains       successful.   30s
    Click Element    ${locatorButtonOK}
    Sleep   1s
    Capture Page Screenshot    3.TFEX Match-{index}.png
    Sleep   1s
    Click Element    xpath=//*[@id="bd-versions"]/span
    Click Element    xpath=/html/body/app-root/app-tfex-master-page/nav/div/div[1]/ul/li/div/a
    Click Element    xpath=/html/body/div/div/div[3]/button[1]
    Sleep   1s
Step : Run Job TfexDecision
    Sleep   1s
    Blockchain TfexApprove
    Blockchain TfexDecline
Step : KTB Confrim Settle
    login JEDI    ${input_user}    ${input_pass}     600283     password
    Sleep   3s
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





