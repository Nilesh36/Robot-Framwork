*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False

*** Variables ***

${EmailTextBox_1}    //input[@name = 'email']
${PasswordTextBox_1}    //input[@name = 'password']
${Gmail_Next_Button}    //span[contains(text(),"Next")]

*** Keywords ***

Launch Gmail    [Arguments]        ${Browser}

    open browser    shorturl.at/oxyLT    ${Browser}
    maximize browser window

Enter Gmail    [Arguments]    ${Email}

    wait until element is enabled    ${EmailTextBox_1}    45s
    input text    //input[@name = 'email']    ${Email}    #Email address text box
    Click Element    ${Gmail_Next_Button}

Enter G_Password    [Arguments]    ${Password}

    wait until element is enabled    ${PasswordTextBox_1}  45s
    input text    ${PasswordTextBox_1}    ${Password}    #Password text box
    Click Element    ${Gmail_Next_Button}

Login into gmail account    [Arguments]    ${Browser}    ${Email}    ${Password}

    Launch Gmail    ${Browser=='chrome'}
    Enter Gmail    ${Email}
    Enter G_Password    ${Password}