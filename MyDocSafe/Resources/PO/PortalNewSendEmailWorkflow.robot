*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../../Library/CustomKeywords.py
Resource    ../../Resources/Common.robot
Resource    ../../Resources/PO/LoginPage.robot
Resource    ../../Resources/PO/AddUsers.robot

*** Variables ***

${PortalsButton}    (//span[@class='mds-header--menu-button-name'])[3]
${Email_Portal_Link}    //md-list-item[@class='secondary-button-padding _md-button-wrap md-with-secondary _md md-clickable']//div[@class='md-button md-no-style'] | //button[starts-with(@aria-label,"Test Workflow Email")]
${FirstPortalGroup}    //md-list-item[@class='md-list-item-no-overflow _md-button-wrap md-with-secondary _md']
${WorkflowButton}    //a[@feature-flag='ffPortalWorkflowModels'] | //span[contains(text(),"Workflows")]
${PlusIconWorkFlow}    //div[@class="q-table__top relative-position row items-center"]//button//span[2]
${NewWorkflowPage}    //h1[@class="q-mt-none"]
${NewWorkFlowButton}    //div[@class='q-item__label']
${WorkflowElementPlusIcon}    //i[@class='q-icon fas fa-plus']
${SendEmailButtonElement}    //div[contains(text(),'Send Email')]
${SubjectField}    //input[@class="q-field__native q-placeholder"][@aria-label="Subject"]
${MessageField}    //textarea[@class="q-field__native q-placeholder"]
${SendLinkToWorkFlow}    (//div[@class='q-toggle__thumb absolute flex flex-center no-wrap'])[1]
${ScheduleSendingCheckbox}    //div[@class='q-checkbox__bg absolute']//*[name()='svg']
${SendAutomaticRem}    (//div[@class='q-toggle__thumb absolute flex flex-center no-wrap'])[2]
${RepeatFieldSchedule}    (//input[@class="q-field__native q-placeholder"])[3]
${Repeat}    2
${Times}    3
${RepeatTimesField}    (//input[@class="q-field__native q-placeholder"])[5]
${RepeatDaysField}    (//div[@class='q-field__inner relative-position col self-stretch'])[7]
${SaveButton}    //span[contains(text(),'Save')]
${DeleteButton}    //span[contains(text(),'Delete')]

*** Keywords ***

Open Portal

    wait until element is enabled    ${PortalsButton}    20s
    click element    ${PortalsButton}
    Log To Console    Clicked On Portals Nav Tab Button
    wait until element is enabled    ${Email_Portal_Link}    20s
    click element    ${Email_Portal_Link}
    Log To Console    Clicked On Test Email Portal
    wait until element is enabled    ${FirstPortalGroup}    20s
    click element    ${FirstPortalGroup}
    Log To Console    Clicked On First Portal Group

Open Workflow Page

    wait until element is enabled    ${WorkflowButton}    20s
    click element    ${WorkflowButton}
    Log To Console    Clicked Workflow Button

Click Plus Button In Workflow

    wait until element is enabled    ${PlusIconWorkFlow}    20s
    click element    ${PlusIconWorkFlow}
    Log To Console    Clicked on Plus Icon

Click Add New WorkFlow Button

    wait until element is enabled    ${NewWorkFlowButton}    20s
    click element    ${NewWorkFlowButton}
    Log To Console    Clicked On Add New Workflow button

Click Plus Icon WorkFlow Element

    wait until element is enabled    ${WorkflowElementPlusIcon}    20s
    click element    ${WorkflowElementPlusIcon}
    Log To Console    Clicked On Plus Icon to Add Workflow Element

Click Send Email Element To Add

    wait until element is enabled    ${SendEmailButtonElement}    20s
    click element    ${SendEmailButtonElement}
    Log To Console    Clicked On Send Email

Enter Subject And Message in New Workflow Form


    Sleep    7s
    ${Subject}    Set Variable    Adding New Send Email Schedule WorkFlow
    ${Message}    Set Variable    Email WorkFlow Message
    input text    ${SubjectField}    ${Subject}
    Log To Console    Entered Subject
    input text    ${MessageField}    ${Message}
    Log To Console    Entered Message

Schedule Email To Be Sent How Many Times

    wait until element is enabled    ${SendLinkToWorkFlow}    20s
    click element    ${SendLinkToWorkFlow}
    Log To Console    Clicked On Send Link To Workflow Slider
    wait until element is enabled    ${ScheduleSendingCheckbox}    20s
    click element    ${ScheduleSendingCheckbox}
    Log To Console    Clicked On Test Email Portal
    wait until element is enabled    ${SendAutomaticRem}    20s
    click element    ${SendAutomaticRem}
    Log To Console    Clicked On Send Automatic Reminder Slider
    Sleep    4s
    input text    ${RepeatFieldSchedule}    ${Repeat}
    Log To Console    Entered Repeat Schedule Count
    input text    ${RepeatTimesField}    ${Times}
    Log To Console    Entered Repeat Times Schedule Count


Click On Save Button To Save Email Workflow

    wait until element is enabled    ${SaveButton}    20s
    click element    ${SaveButton}
    Log To Console    Clicked On Send Link To Workflow Slider
    Sleep    5s
    Close Browser