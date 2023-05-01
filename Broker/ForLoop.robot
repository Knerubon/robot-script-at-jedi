*** Settings ***
Library    Selenium2Library
Library     String
Suite Setup    Suite Setup     
***Suite Teardown  Close Browser

*** Variables ***
${browser}     chrome
${url}    #
${Path}   D:/WorkKTB/JEDIRobotTest/image
${locatorTable}    xpath=//*[@id="trade_list"]
${ddlStatus}    xpath=//td[contains(@id,'idSelect ')]
*** Test Cases ***
Login case
    Broker Test

*** Keywords ***
Suite Setup
   Open Browser  ${url}  ${browser}
   Set Screenshot Directory  ${Path}

Broker Test
   Input Text       id=txtUsername    #
    Input Password   id=txtPassword    #
    Click Button     id=btnLogin
    Wait Until Element Is Visible  ${locatorTable}    30s
    ${rowcnt} =    Get Element Count   ${locatorTable}/tbody/tr
    @{elements}    Get Webelements    //*[starts-with(@id, 'idSelect-')]
    @{ids}    Evaluate    [elem.get_attribute('id') for elem in $elements]
    FOR    ${element}    IN    @{ids}
         ${tradeId}=    Get Substring  ${element}   9
         Log    Num value is ${tradeId} 
    END