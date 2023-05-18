*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py
Library    Dialogs

*** Variables ***

${FirstName}    //input[@name = 'firstName']
${LastName}    //input[@name = 'lastName']
${EmailAddress_UR}    //input[@name = 'email']
${TermsCheckBox}    //div[@class = 'md-container md-ink-ripple']
${Capcha}    //div[@class = 'recaptcha-checkbox-border']
${StartFreeTrialButton}    //span[text() = 'Start a free trial']//parent::translate//parent::button
${SignupCongratulationText}    //div[@class = 'signup-congratulations']

*** Keywords ***

Enter First Name_UR

    ${FirstNameValue}    randomword
    wait until element is enabled    ${FirstName}  45s
    input text    ${FirstName}    ${FirstNameValue}

Enter Last Name_UR

    ${LastNameValue}    randomword
    wait until element is enabled    ${LastName}  45s
    input text    ${LastName}    ${LastNameValue}

Type Email_UR

    ${domain}    set variable    @mailinator.com
    ${EmailValue}    randomword
    ${EmailValue}    set variable    ${EmailValue}${domain}
    wait until element is enabled    ${EmailAddress_UR}  45s
    input text    ${EmailAddress_UR}    ${EmailValue}
    [Return]    ${EmailValue}

Click Terms checkbox

    wait until element is enabled    ${TermsCheckBox}  45s
    click element    ${TermsCheckBox}

Click Start a free trial button

    wait until element is enabled    ${StartFreeTrialButton}  45s
    click element    ${StartFreeTrialButton}

Wait for successful registration page

    wait until element is visible    ${SignupCongratulationText}  45s
    capture page screenshot    Registration_Successful.png

Register New User

    Enter First Name_UR
    Enter Last Name_UR
    ${NewUserRegistrationEmail}    Type Email_UR
    Click Terms checkbox
    execute manual step    Please select the CAPTCHA
    Click Start a free trial button
    wait for successful registration page
    [Return]    ${NewUserRegistrationEmail}
    close browser
