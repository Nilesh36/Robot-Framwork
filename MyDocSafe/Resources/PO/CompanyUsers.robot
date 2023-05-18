*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py
Resource    ../../Resources/PO/CreateForm.robot

*** Variables ***

${CompanyUsersButton}
${AddUserEmail}    //input[@placeholder = 'Email address']
${SelectRole}    //md-select[@ng-model = 'vm.role']
${AddUserButton}    //span[text() = 'Add user']//parent::translate//parent::button
${UserAddedVerify}    //button[contains(@aria-label, 'Pending')]
${UserOptions}    //button[@ng-click = '$mdMenu.open()']//parent::md-menu
${RemoveUserButton}    (//span[text() = 'Remove user']//parent::translate//parent::button)
${ConfirmDeleteUser}    //span[text() = 'Yes, delete']//parent::button
${AcceptTheUserInvite}    //button[text() = 'Accept']

*** Keywords ***

Add Email    [Arguments]    ${EmailAddress}

    wait until element is enabled    ${AddUserEmail}  45s
    input text    ${AddUserEmail}    ${EmailAddress}
    sleep    2s
    wait until element is enabled    //span[text() = '${EmailAddress}']    45s
    click element    //span[text() = '${EmailAddress}']

Select Role    [Arguments]    ${Rolename}

    wait until element is enabled    ${SelectRole}  45s
    click element    ${SelectRole}
    wait until element is enabled    //div[contains(text(), '${Rolename}')]  45s
    click element    //div[contains(text(), '${Rolename}')]

Click Add User button

    wait until element is enabled    ${AddUserButton}  45s
    click element    ${AddUserButton}

Verify the user is added successfully

    wait until element is enabled    ${UserAddedVerify}    45s
    capture page screenshot    User_added.png

Click Options under user    [Arguments]    ${User}

    wait until element is enabled    //button[contains(@aria-label, '${User}')]//parent::div/div[2]/md-menu/button    45s
    click element    //button[contains(@aria-label, '${User}')]//parent::div/div[2]/md-menu/button
    sleep    1s

Click Remove User button

    wait until element is enabled    ${RemoveUserButton}  45s
    ${count}    get element count    ${RemoveUserButton}
    click element    (//span[text() = 'Remove user']//parent::translate//parent::button)[${count}]
    sleep    3s

Confirm Delete

    wait until element is enabled    ${ConfirmDeleteUser}  45s
    click element    ${ConfirmDeleteUser}

Accept the User Invite

    wait until element is enabled    ${AcceptTheUserInvite}  45s
    click element    ${AcceptTheUserInvite}
    sleep    3s

Navigate to Company name    [Arguments]    ${CompanyName}

    wait until element is enabled    //a[@aria-label = '${CompanyName}']  45s
    sleep    3s
    click element    //a[@aria-label = '${CompanyName}']

Verify the document page of Account A is displayed    [Arguments]    ${CompanyName}

    wait until element is enabled    //span[text() = '${CompanyName}']    45s
    capture page screenshot    DocumentPage_A.png

Add User    [Arguments]    ${EmailAddress}    ${Rolename}

    Add Email    ${EmailAddress}
    Select Role    ${Rolename}
    Click Add User button

Remove User    [Arguments]    ${UserEmailAddress}

    Click Options under user    ${UserEmailAddress}
    Click Remove User button
    Confirm Delete
    sleep    1s
    wait until element is not visible    ${UserAddedVerify}  45s
    capture page screenshot    User_deleted.png


