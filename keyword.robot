*** Variables ***
${browser}    chrome
${url}    #
${OUTPUTDIR}   D:\WorkKTB\JEDIRobotTest\image
*** Keywords ***
Open Web JEDI
    Open Browser     ${url}     ${browser}

No Username and No Password
    Click Button     id=btnLogin