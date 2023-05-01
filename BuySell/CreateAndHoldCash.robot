*** Settings ***
Library    Selenium2Library
Suite Setup    Suite Setup
Library     RequestsLibrary
Library     Collections
Library     String
Library    HttpLibrary.HTTP 
***Suite Teardown  Close Browser

*** Variables ***
${url}     #/jedi/api/v1
${pathCreateBlockChain}      task/blockchain/create/createtradeblockchain
${pathPermanentHold}        task/permanent/PermanentHold
${pathImage}   D:/WorkKTB/JEDIRobotTest/image
${token}    Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTIwMDU3MTQsInNvdXJjZSI6IlNtYXJ0RlgiLCJzeXN0ZW0iOiJKRURJIiwidXNlcm5hbWUiOiJhZG1pbiJ9.uLUslBHjGWkWroV5JdFh57Z5EqZZTEoTri9ixivJIYk
${modeBlockChain}   Create
${modePermanent}    PermanentHold

*** Test Cases ***
Login case
    Create blockchain
    Hold Cash

*** Keywords ***
Suite Setup
   Set Screenshot Directory  ${pathImage}

Create blockchain
    ${json_string}=    catenate
    ...  {
    ...    "Mode": \"${modeBlockChain}\",
    ...    "AsOfDate": ""
    ...  }
    &{headers}=    Create Dictionary    Content-Type=application/json   Authorization=${token}
    Create Session  tmd   ${url}
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
    Create Session  tmd   ${url}
    ${resp}=    POST Request    tmd    ${pathPermanentHold}    data=${json_string}    headers=${headers}
    Log    Num value is ${resp.text}
    Should Be Equal  ${resp.status_code}  ${200}   
  