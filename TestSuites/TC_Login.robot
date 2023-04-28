*** Settings ***
Library    Selenium2Library
# Library    BuiltIn
# Library    String
Suite Setup        Suite Setup 
Suite Teardown     Close All Browsers

Resource        ../Resources/keywords.robot
Resource        ../Resources/variables.robot


*** Test Cases ***

Case1 : Login No Username and No Password
    [tags]    fail 
    Click Button     ${btn_login}
    Wait Until Page Contains    Username is required  30s   
    Wait Until Page Contains    Password is required  30s 
    Capture Page Screenshot    1.login_No_Username_and_No_Password-{index}.png  

Case2 : Login Username and No Password
    [tags]    fail
    # Open Browser        about:blank    ${browser}
    # Go To               ${url_JEDI}
    #Verify JEDI Page    ${title_JEDI} 
    Input Username and Password     ${input_user}   ${input_pass}   ${username_fail}      ${no_password}
    Click Button Login          ${btn_login}
    Wait Until Page Contains     Password is required  30s
    Capture Page Screenshot    2.Login_Username_and_no_Password-{index}.png
    Reload Page

Case3 : Login No Username and Password
    [tags]    fail
    # Open Browser        about:blank    ${browser}
    Go To               ${url_JEDI}
    Verify JEDI Page    ${title_JEDI} 
    Input Username and Password     ${input_user}   ${input_pass}   ${no_user}      ${password_success}
    Click Button Login          ${btn_login}
    Wait Until Page Contains     Username is required  30s
    Capture Page Screenshot    3.Login_No_Username_and_Password_success-{index}.png
    Reload Page

Case4 : Login Username and Password incorrect
    [tags]    fail
    # Open Browser        about:blank    ${browser}
    # Go To               ${url_JEDI}
    Verify JEDI Page    ${title_JEDI} 
    Input Username and Password     ${input_user}   ${input_pass}   ${username_fail}      ${password_fail}
    Click Button Login          ${btn_login} 
    Wait Until Page Contains     Username not register in JEDI system  30s
    Capture Page Screenshot    4.Login_Username_and_Password_incorrect-{index}.png
    Click Button    xpath:/html/body/div/div/div[3]/button[1]
    Reload Page

Case5 : Login Username incorrect and Password
    [tags]    fail
    Verify JEDI Page    ${title_JEDI} 
    Input Username and Password     ${input_user}   ${input_pass}   ${username_fail}      ${password_success}
    Click Button Login          ${btn_login}
    Wait Until Page Contains      Username not register in JEDI system  30s
    Capture Page Screenshot    5.Login_Username_incorrect_and_Password-{index}.png
    Click Button    xpath:/html/body/div/div/div[3]/button[1]
    Reload Page

Case6 : Login Username and Password incorrect
    [tags]    fail
    Verify JEDI Page    ${title_JEDI} 
    Input Username and Password     ${input_user}   ${input_pass}   ${username_success}      ${password_fail}
    Click Button Login          ${btn_login}
    Wait Until Page Contains      Password is incorrect  30s
    Capture Page Screenshot    6.Login_Username_and_Password_incorrect-{index}.png
    Click Button    xpath:/html/body/div/div/div[3]/button[1]
    Reload Page

Case7 : Login Username and Password Success
    [tags]    pass
    Verify JEDI Page    ${title_JEDI} 
    Input Username and Password     ${input_user}   ${input_pass}   ${username_success}      ${password_success}
    Click Button Login          ${btn_login}
    Wait Until Page Contains    You will get into FCD account  30s
    Capture Page Screenshot    7.Login_Username_and_Password_Success-{index}.png
    
