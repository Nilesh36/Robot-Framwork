*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py
Resource    ../../Resources/PO/SignForm.robot
Library    String

*** Variables ***

${TermsCheckBox}    //md-checkbox[@name = 'terms']/div[1]
${NextButtonAcceptInvite}    //span[contains(text(), 'Next')]//parent::button
${NewPasswordTextBox}    (//input[@type = 'password'])[1]
${ConfirmPasswordTextBox}    (//input[@type = 'password'])[2]
${SubmitNext}    //input[@type = 'submit']
${AcceptAndProceedButton}    //span[text() = 'Accept and proceed']//parent::translate//parent::button
${ClientFirstNameTextBox}    //input[@name = 'text_wxdhebfxecmquab']
${ClientLastNameTextBox}    //input[@name = 'text_hzyjsopgaavwrwc']
${GenderRadioButton}    //md-radio-button[@value = 'Female']//div[@class = 'md-container md-ink-ripple']
${PrimaryContactEmail}    (//input[@type = 'email'])[1]
${BuildingNumber}    (//input[@ng-model = 'vm.answers[element.id].buildingNumber'])[1]
${Street}    (//input[@ng-model = 'vm.answers[element.id].street'])[1]
${City}    (//input[@ng-model = 'vm.answers[element.id].town'])[1]
${State}    (//input[@ng-model = 'vm.answers[element.id].state'])[1]
${Zip}    (//input[@ng-model = 'vm.answers[element.id].postcode'])[1]
${MoveInDate}    (//input[@aria-label = 'Enter date'])[1]
${NextButtonFillClient}     (//span[contains(text(), 'NEXT')]//parent::button)[1]
${ProposalCompletionPage}    //div[contains(text(), 'Thank you for completing the proposal')]


*** Keywords ***

Accept Invite And Setup Password

    switch window    NEW
    wait until element is enabled    ${TermsCheckBox}    45s
    click element    ${TermsCheckBox}
    sleep    1s
    wait until element is enabled    ${NextButtonAcceptInvite}
    click element    ${NextButtonAcceptInvite}
    wait until element is enabled    ${NewPasswordTextBox}    45s
    input text    ${NewPasswordTextBox}    Testing1!
    wait until element is enabled    ${ConfirmPasswordTextBox}    45s
    input text    ${ConfirmPasswordTextBox}    Testing1!
    wait until element is enabled    ${SubmitNext}
    sleep    2s
    click element    ${SubmitNext}

Click Accept and Proceed

    wait until element is enabled    ${AcceptAndProceedButton}    45s
    sleep    2s
    click element    ${AcceptAndProceedButton}

Enter Recipient first Name

    ${FirstName}    randomword
    wait until element is enabled    ${ClientFirstNameTextBox}    45s
    input text    ${ClientFirstNameTextBox}    ${FirstName}

Enter Recipient Last Name

    ${LastName}    randomword
    wait until element is enabled    ${ClientLastNameTextBox}  45s
    input text    ${ClientLastNameTextBox}    ${LastName}

Select Gender    [Arguments]    ${Gender}

    wait until element is enabled    //md-radio-button[@value = '${Gender}']//div[@class = 'md-container md-ink-ripple']  45s
    click element    //md-radio-button[@value = '${Gender}']//div[@class = 'md-container md-ink-ripple']

Select Type of Work    [Arguments]    ${TypeofWork}

    wait until element is enabled    //md-checkbox[@aria-label = '${TypeofWork}']//div[@class = 'md-container md-ink-ripple']  45s
    scroll element into view    //md-checkbox[@aria-label = '${TypeofWork}']//div[@class = 'md-container md-ink-ripple']
    click element    //md-checkbox[@aria-label = '${TypeofWork}']//div[@class = 'md-container md-ink-ripple']

Enter Primary Contact Email address

    wait until element is enabled    ${PrimaryContactEmail}  45s
    scroll element into view    ${PrimaryContactEmail}
    ${Email}    randomemail
    input text    ${PrimaryContactEmail}    ${Email}

Enter Current Home Address

    wait until element is enabled    ${BuildingNumber}  45s
    scroll element into view    ${BuildingNumber}
    input text    ${BuildingNumber}    111
    wait until element is enabled    ${Street}  45s
    input text    ${Street}    XYZ Street
    wait until element is enabled    ${State}  45s
    input text    ${State}    ENGLAND
    wait until element is enabled    ${City}  45s
    input text    ${City}    LONDON
    wait until element is enabled    ${Zip}  45s
    input text    ${Zip}    5208
    wait until element is enabled    ${MoveInDate}  45s
    input text    ${MoveInDate}    01/01/2022
    sleep    1s
#    press keys    ${MoveInDate}    TAB

Click Next Button and Sign the Terms of Business

    wait until element is enabled    ${NextButtonFillClient}  45s
    click element    ${NextButtonFillClient}
    Click Approve Button
    Submit Signature
    sleep    2s
    wait until element is enabled    ${ProposalCompletionPage}    45s
    capture page screenshot    Proposal_Completion.png
    sleep    5s

Verify the Proposals Status-Sent    [Arguments]    ${ProposalEmail}

    ${ProposalEmail}    convert to lower case    ${ProposalEmail}
    wait until element is enabled    //p[contains(text(), '${ProposalEmail} (pending)')]//parent::div//parent::md-list-item/div[4]/p[contains(text(), 'sent')]    45s
    sleep    1s
    capture page screenshot    Proposal_Status.png

Verify the Proposals Status-Won    [Arguments]    ${ProposalEmail}

    ${ProposalEmail}    convert to lower case    ${ProposalEmail}
    wait until element is enabled    //p[contains(text(), '${ProposalEmail}')]//parent::div//parent::md-list-item/div[4]/p[contains(text(), 'won')]    45s
    sleep    1s
    capture page screenshot    Proposal_Status.png

Fill the new client information form - Personal

    Enter Recipient first Name
    Enter Recipient Last Name
    Select Gender    Female
    Select Type of Work    Self Employed Business
    Enter Primary Contact Email address
    Enter Current Home Address
    Click Next Button and Sign the Terms of Business