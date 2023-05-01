*** Settings ***
Library    Selenium2Library
Suite Setup    Suite Setup
Library        ExcelLibrary  
Suite Teardown  Close Browser


*** Variables ***
${browser}     chrome
${url}    #
${Path}    D:/JEDI/Robot/HappyCase/image
${path_excel}     D:/JEDI/Test Case/Trade_Calendar.csv
${msg_start}      Test case
${msg_end}        Goodbye!!!
${input_user}     xpath=//*[@id="txtUsername"]
${input_pass}     xpath=//*[@id="txtPassword"]
${btn}          xpath=//*[@id="btnLogin"]
${btn_upload}   xpath=/html/body/app-root/app-ktb-master-page/app-ktb-home/main/div[1]/div/form/div[2]/div/button
${btn_ok}     xpath=/html/body/div/div/div[3]/button[1]
${Choose File}      xpath=/html/body/app-root/app-ktb-master-page/app-ktb-home/main/div[1]/div/form/div[2]/div/input

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
upload CSV : Fail
    Open Browsers
    Login user KTB    ${input_user}   ${input_pass}    #    # 
    sleep  3s
    Element Should Be Visible    ${btn_upload}   40s
    Click Element    ${btn_upload}
    sleep  2s
    Capture Page Screenshot    upload CSV Fail-{index}.png
    Wait Until Page Contains    Please select file excel before upload   30s
    sleep  1s
    Click Button    ${btn_ok}
    Reload Page

upload CSV : pass
    sleep  3s
    Choose File    ${Choose File}    ${path_excel}
    Element Should Be Visible    ${btn_upload}   40s
    Click Element    ${btn_upload}
    sleep  2s
    Capture Page Screenshot    upload CSV Pass-{index}.png
    Wait Until Page Contains    Upload Bid/Ask successful.   30s
    sleep  1s
    Click Button    ${btn_ok}
    sleep  2s
    

