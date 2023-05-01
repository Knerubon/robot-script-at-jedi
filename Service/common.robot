*** Settings ***
Library         Selenium2Library
Library         RequestsLibrary
Library         Collections
Library         String

#Library         HttpLibrary.HTTP 
#Suite Teardown  Close Browser

*** Variables ***
${browser}          chrome
${urlWeb}           #/jedi/login
${urlApi}           #/jedi/api/v1
${pathImage}        C:/ProjectKTB/JEDIRobotTest/image/broker
${token}            Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTIwMDU3MTQsInNvdXJjZSI6IlNtYXJ0RlgiLCJzeXN0ZW0iOiJKRURJIiwidXNlcm5hbWUiOiJhZG1pbiJ9.uLUslBHjGWkWroV5JdFh57Z5EqZZTEoTri9ixivJIYk

${msg_start}            Test JEDI
${msg_end}              Goodbye!!!

${pathCreateBlockChain}             task/blockchain/create/createtradeblockchain
${pathDeclineBrokerBlockChain}      task/blockchain/brokerdecision/declinetradeblockchain
${pathApproveBrokerBlockChain}      task/blockchain/brokerdecision/approvetradeblockchain
${pathtApproveTfexBlockchain}       task/blockchain/tfexdecision/approvetradeblockchain
${pathtDeclineTfexBlockchain}       task/blockchain/tfexdecision/declinetradeblockchain
${pathPermanentHold}                task/permanent/PermanentHold
${pathPermanentUnHold}              task/permanent/PermanentUnHold



# Mode BlockChain
${modeBlockChainCreate}             Create
${modePermanentHold}                PermanentHold
${modePermanentUnHold}              PermanentUnHold
${modeBlockChainBrokerApprove}      BrokerApprove
${modeBlockChainBrokerDecline}      BrokerDecline
${modeBlockChainTfexApprove}        TfexApprove
${modeBlockChainTfexDecline}        TfexDecline
${modeBlockChainKTBUnHold}          KTBUnHold

#login
${input_user}       id=txtUsername
${input_pass}       id=txtPassword
${btn_login}        id=btnLogin


*** Keywords ***
Open Browsers
   Open Browser  ${urlWeb}  ${browser}
   Maximize Browser Window
   Log to console  ${msg_start}

Suite Setup
   Set Screenshot Directory  ${pathImage}

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

Call API Blockchain
    [Arguments]     ${mode}     ${url}
    ${json_string}=    catenate
    ...  {
    ...    "Mode": \"${mode}\",
    ...    "AsOfDate": ""
    ...  }
    &{headers}=    Create Dictionary    Content-Type=application/json   Authorization=${token}
    Create Session  tmd   ${url}
    ${resp}=    POST Request    tmd    ${urlApi}    data=${json_string}    headers=${headers}
    Log    Num value is ${resp.text}
    Should Be Equal  ${resp.status_code}  ${200}


