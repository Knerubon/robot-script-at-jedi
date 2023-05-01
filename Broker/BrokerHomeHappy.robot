*** Settings ***
Library         Selenium2Library
Library         String
Test Setup      Open Browsers
Test Teardown   Close All Browsers
Suite Setup     Suite Setup
Suite Teardown  Log to console  Goodbye!!!

*** Variables ***
${browser}     chrome
#${url}  #
${url}   # 
${path}   C:/ProjectKTB/JEDIRobotTest/image/broker
${select_value}  Approve
${locatorButtonDownland}  xpath://*[@id="downloadCsvAll"]
${title}   xpath:/html/body/app-root/app-broker-master-page/app-broker-home/main/div[2]/h1
${input_user}       id=txtUsername
${input_pass}       id=txtPassword
${btn_login}        id=btnLogin
${username_success}     #
${password_success}     #
${msg_start}            Test broker dowland happy case
${msg_end}              Goodbye!!!

*** Keywords ***
Open Browsers
   Open Browser  ${url}  ${browser}
   Log to console  ${msg_start}

Suite Setup
   Set Screenshot Directory  ${path}

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

*** Test Cases ***
Broker case
    [tags]    pass
    Input Username and Password    ${input_user}   ${input_pass}   ${username_success}     ${password_success} 
    Click Button Login     ${btn_login}  

    wait until element is enabled  //*[starts-with(@id, 'idSelect-')]   30s
    #Wait Until Element Is Visible  ${locatorTable}   30s
    #${rowcnt} =    Get Element Count   ${locatorTable}/tbody/tr
    @{elements}   Get Webelements    //*[starts-with(@id, 'idSelect-')]
    @{ids}    Evaluate    [elem.get_attribute('id') for elem in $elements]
    Log  ${ids}

    FOR    ${element}    IN    @{ids}
           ${tradeId}     Get Substring  ${element}   9
         Log  ${tradeId}
         Select From List By Label  //*[@id="idSelect-${tradeId}"]   Approve 
    END

   Sleep   3s
   Click Element     ${locatorButtonDownland}
   Sleep   3s
   Capture Page Screenshot  broker_downland_happy-{index}.png 
   Sleep   5s
    
