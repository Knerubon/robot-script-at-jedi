*** Settings ***
Library    Selenium2Library
Suite Setup    Suite Setup
Suite Teardown  Close Browser


*** Variables ***
${browser}     chrome
${url}    #
${Path}    D:/JEDI/Robot/HappyCase/image
${msg_start}      Test case
${msg_end}        Goodbye!!!
${input_user}     xpath=//*[@id="txtUsername"]
${input_pass}     xpath=//*[@id="txtPassword"]
${btn}           xpath=//*[@id="btnLogin"]
${btn_update}    xpath=/html/body/app-root/app-ktb-master-page/app-ktb-home/main/div[1]/div/form/div[4]/button
${btn_yes}    xpath=//*[@id="confirm"]/div/div/div/div/div[2]/button[2]
${btn_ok}     xpath=/html/body/div/div/div[3]/button[1]
#TD
${td1_Bid}      xpath=/html/body/app-root/app-ktb-master-page/app-ktb-home/main/div[1]/div/form/div[3]/table/tbody/tr[1]/td[4]/ngx-numeric-textbox/input
${td2_Bid}      xpath=/html/body/app-root/app-ktb-master-page/app-ktb-home/main/div[1]/div/form/div[3]/table/tbody/tr[2]/td[4]/ngx-numeric-textbox/input
${td3_Bid}      xpath=/html/body/app-root/app-ktb-master-page/app-ktb-home/main/div[1]/div/form/div[3]/table/tbody/tr[3]/td[4]/ngx-numeric-textbox/input
${td4_Bid}      xpath=/html/body/app-root/app-ktb-master-page/app-ktb-home/main/div[1]/div/form/div[3]/table/tbody/tr[4]/td[4]/ngx-numeric-textbox/input
${td1_Ask}      xpath=/html/body/app-root/app-ktb-master-page/app-ktb-home/main/div[1]/div/form/div[3]/table/tbody/tr[1]/td[5]/ngx-numeric-textbox/input
${td2_Ask}      xpath=/html/body/app-root/app-ktb-master-page/app-ktb-home/main/div[1]/div/form/div[3]/table/tbody/tr[2]/td[5]/ngx-numeric-textbox/input
${td3_Ask}      xpath=/html/body/app-root/app-ktb-master-page/app-ktb-home/main/div[1]/div/form/div[3]/table/tbody/tr[3]/td[5]/ngx-numeric-textbox/input
${td4_Ask}      xpath=/html/body/app-root/app-ktb-master-page/app-ktb-home/main/div[1]/div/form/div[3]/table/tbody/tr[4]/td[5]/ngx-numeric-textbox/input

*** Keywords ***
Open Browsers
   Open Browser  ${url}  ${browser}
   Maximize Browser Window
   Log to console  ${msg_start}

Suite Setup
   Set Screenshot Directory  ${Path}

Login user KTB
    [Arguments]      ${xpath_user}       ${xpath_pass}     ${username}       ${password}
     Element Should Be Visible    ${xpath_user}
     Element Should Be Visible    ${xpath_pass}
     Input Text       ${xpath_user}       ${username}
     Input Text       ${xpath_pass}       ${password}
     Element Should Be Visible      ${btn}
     Click Element      ${btn}


*** Test Cases ***
upload Bid/Ask
    Open Browsers
    Login user KTB    ${input_user}   ${input_pass}    #    # 
    sleep  3s
    Capture Page Screenshot     Before Bid Ask-{index}.png
    sleep  2s
    Input Text       ${td3_Bid}       -11
    Input Text       ${td3_Ask}       -8
    sleep  3s
    Click Button    ${btn_update}
    sleep  2s
    Wait Until Page Contains     Do you want to ‘Confirm’ Update Bid/Ask?  30s
    Click Button    ${btn_yes}
    sleep  2s
    Wait Until Page Contains     Update Bid/Ask successful.  30s
    Click Button    ${btn_ok}
    sleep  2s
    Capture Page Screenshot     After Bid Ask-{index}.png
    sleep  2s
  


    

