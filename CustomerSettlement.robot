*** Settings ***
Library    Selenium2Library
Suite Setup    Suite Setup
Suite Teardown  Close Browser


*** Variables ***
${browser}     chrome
${url}     #
${Path}    D:/JEDI/Robot/HappyCase/image
${msg_start}      Test case
${msg_end}        Goodbye!!!
${input_user}     xpath=//*[@id="txtUsername"]
${input_pass}     xpath=//*[@id="txtPassword"]
${btn}            xpath=//*[@id="btnLogin"]
${KTB_Approve}    xpath=/html/body/app-root/app-customer-master-page/app-customer-execute-offservice/main/div[2]/div/div[2]/div[2]/span
${Sufficient_cash}    xpath=//*[@id="collapseExample"]/div/div[4]/div[2]
${more_detail}      xpath=/html/body/app-root/app-customer-master-page/app-customer-execute-offservice/main/div[2]/div/div[7]/a

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
#Happy Case
KTB : Confirm 
    [Tags]  SETTLEMENT Completed
    Open Browsers
    Login user KTB    ${input_user}   ${input_pass}    customer008    password
    sleep  3s
    Wait Until Page Contains          To be continue tomorrow   40s
    sleep  3s
    ${gettext}     Get Text     ${KTB_Approve}
    Log     ${gettext}
    Should Be True       '${gettext}' == 'Approved'    KTB Action
    Wait Until Page Contains          Sufficient cash (KTB)   40s
    Click Element           ${more_detail} 
    sleep  3s
    ${gettext_}     Get Text     ${Sufficient_cash}
    Log     ${gettext_}
    Should Be True       '${gettext_}' == 'Approved'    Sufficient cash (KTB)

#Unhappy Case
KTB : Confirm 
    [Tags]  SETTLEMENT Failed
    Open Browsers
    Login user KTB    ${input_user}   ${input_pass}    customer007     P@ssw0rd
    sleep  3s
    Wait Until Page Contains          To be continue tomorrow   40s
    sleep  3s
    ${gettext}     Get Text     ${KTB_Approve}
    Log     ${gettext}
    Should Be True       '${gettext}' == 'Approved'    KTB Action
    Wait Until Page Contains          Sufficient cash (KTB)   40s
    Click Element           ${more_detail} 
    sleep  3s
    ${gettext_}     Get Text     ${Sufficient_cash}
    Log     ${gettext_}
    Should Be True       '${gettext_}' == 'Insufficient Fund'    Sufficient cash (KTB)

#Unhappy Case
KTB : Unconfirm
    [Tags]  SETTLEMENT Canceled
    Open Browsers
    Login user KTB    ${input_user}   ${input_pass}    customer008     password
    sleep  3s
    Wait Until Page Contains          To be continue tomorrow   40s
    sleep  3s
    ${gettext}     Get Text     ${KTB_Approve}
    Log     ${gettext}
    Should Be True       '${gettext}' == 'Failed'    KTB Action
    Wait Until Page Contains          Sufficient cash (KTB)   40s
    Click Element           ${more_detail} 
    