*** Settings ***
Library    Selenium2Library
Library     RequestsLibrary
Library     Collections
Library     String
#Library     HttpLibrary.HTTP 
Suite Setup    Suite Setup
Suite Teardown  Log to console  Goodbye!!!
 
*** Variables ***
# ${url}     #/jedi/api/v1
${urlBrokerdecision}     #/jedi/api/v1
${urlPermanent}         #/jedi/api/v1
 
${pathDeclineBlockChain}      task/blockchain/brokerdecision/declinetradeblockchain
${pathApproveBlockChain}      task/blockchain/brokerdecision/approvetradeblockchain
${pathPermanentUnHold}        task/permanent/PermanentUnHold

${pathImage}   C:/ProjectKTB/JEDIRobotTest/image/broker
${token}    # 
${modeBlockChainBrokerApprove}   BrokerApprove
${modeBlockChainBrokerDecline}   BrokerDecline
${modePermanentUnHold}    PermanentUnHold

*** Test Cases ***
Login case
    Approve blockchain
    Decline blockchain
    UnHold Cash

*** Keywords ***
Suite Setup
   Set Screenshot Directory  ${pathImage}

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