*** Settings ***
Library    Selenium2Library
Library    BuiltIn
Library    String

Resource        ../Resources/variables.robot

*** Keywords ***

Suite Setup
   Open Browser  ${url_JEDI}  ${browser}
   Set Screenshot Directory  ${Path}

Verify JEDI Page
    [Arguments]                ${title}
    Title Should Be            ${title}

Input Username and Password
    [Arguments]      ${xpath_user}       ${xpath_pass}     ${username}       ${password}
     Element Should Be Visible    ${xpath_user}
     Element Should Be Visible    ${xpath_pass}
     Input Text       ${xpath_user}       ${username}
     Input Text       ${xpath_pass}       ${password}

Click Button Login
    [Arguments]       ${btn}
     Element Should Be Visible    ${btn}
     Click Element        ${btn}

Verify Login Fail
   [Arguments]        ${xpath}
   Element Should Be Visible        ${xpath}
   
Verify Login Success
   [Arguments]        ${xpath}
   Element Should Be Visible        ${xpath}