*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py
Resource    ../../Resources/PO/TabsPage.robot
Resource    ../../Resources/PO/AddNewContact.robot
Library    String

*** Variables ***

${CreateANewGroupButton}    //span[text() = 'Create a new group']//parent::translate//parent::button
${GroupNameTextField}    //input[@ng-model = '$ctrl.name']
${SaveGroupButton}    //span[text() = 'Save']//parent::translate//parent::button
${ManageGroupsButton}    //span[text() = 'Manage Groups']//parent::translate//parent::button
${SearchGroupTextBox}    //input[@placeholder = 'Search groups']
${ManageGroupContacts}    //span[text() = 'Manage Group Contacts']//parent::translate//parent::button
${SearchContactTextBox}    //input[@placeholder = 'Search contacts']
${OkButtonAddContact}    //span[text() = 'Ok']//parent::translate//parent::button
${DuplicateGroupErrormessage}    //p[contains(text(), 'Contact group exists')]//parent::div
${DeleteGroupButton}    //span[text() = 'Delete Group']//parent::translate//parent::button
${ConfirmDeletegroupButton}    //span[text() = 'Yes, delete']//parent::button

*** Keywords ***

Click Create a New Group Button

    wait until element is enabled    ${CreateANewGroupButton}    45s
    sleep    2s
    click element    ${CreateANewGroupButton}

Enter Group Name    [Arguments]    ${GroupName}

    wait until element is enabled    ${GroupNameTextField}  45s
    input text    ${GroupNameTextField}    ${GroupName}

Click Save to Save Group

    wait until element is enabled    ${SaveGroupButton}  45s
    click element    ${SaveGroupButton}

Verify group is created    [Arguments]    ${GroupName}

    wait until element is visible    //span[contains(text(), '${GroupName}')]//parent::div    45s
    element should be visible    //span[contains(text(), '${GroupName}')]//parent::div
    capture page screenshot    Group_Created.png

Click Manage Groups

    wait until element is enabled    ${ManageGroupsButton}  45s
    sleep    2s
    click element    ${ManageGroupsButton}

Search and Add Group    [Arguments]    ${GroupName}

    wait until element is enabled    ${SearchGroupTextBox}  45s
    input text    ${SearchGroupTextBox}    ${GroupName}
    sleep    1s
    wait until element is enabled    //div/p[text() = '${GroupName}']//parent::div//parent::div/div[2]/md-checkbox  45s
    click element    //div/p[text() = '${GroupName}']//parent::div//parent::div/div[2]/md-checkbox

Click Save to Add Group

    wait until element is enabled    ${SaveGroupButton}  45s
    click element    ${SaveGroupButton}

Navigate to Group    [Arguments]    ${GroupName}

    wait until element is enabled    //div/a[@aria-label = '${GroupName}']  45s
    click element    //div/a[@aria-label = '${GroupName}']

Contact should be displayed in the group    [Arguments]    ${ContactEmailAddress}

    wait until element is visible    //div/a[contains(@aria-label, '${ContactEmailAddress}')]  45s

Click Manage group contacts

    wait until element is enabled    ${ManageGroupContacts}  45s
    click element    ${ManageGroupContacts}

Search and Add contacts    [Arguments]    ${Contact}

    wait until element is enabled    ${SearchContactTextBox}  45s
    input text    ${SearchContactTextBox}    ${Contact}
    sleep    1s
    wait until element is enabled    //div/p[contains(text(),'${Contact}')]//parent::div/md-switch/div[1]  45s
    click element    //div/p[contains(text(),'${Contact}')]//parent::div/md-switch/div[1]

Click Save to Add contacts

    wait until element is enabled    ${OkButtonAddContact}  45s
    click element    ${OkButtonAddContact}

Verify the duplicate group name error message

    wait until element is visible    ${DuplicateGroupErrormessage}  45s
    element should be visible    ${DuplicateGroupErrormessage}
    capture page screenshot    Duplicate_group.png

Click Delete group button

    wait until element is enabled    ${DeleteGroupButton}  45s
    sleep    1s
    click element    ${DeleteGroupButton}

Click confirm delete group

    wait until element is enabled    ${ConfirmDeletegroupButton}  45s
    sleep    1s
    click element    ${ConfirmDeletegroupButton}

Delete group

    Click Delete group button
    Click confirm delete group
    sleep    3s