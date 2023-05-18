*** Settings ***
Resource    ../../Resources/PO/LoginPage.robot
Resource    ../../Resources/PO/AddUsers.robot

*** Variables ***

${CGWM_Company}    //a[@aria-label="CGWM Model Portfolio Management Portal - staging"]
${External_Asset_Management}    //button[@ng-click="openItem(item, group.children)"]
${FH_DFM_Portal}    //a[contains(text(),"FH DFM Portal")]//..//..//..//..//..
${Create_Instruction}    //span[contains(text(),"Create instruction")]
${Model_Portfolio_Implemantaion}    //span[contains(text(),"Model Portfolio Implementation")]//..//..//div//div[@class='md-off']
${Next_Button_CGWM}    (//span[contains(text(),"NEXT")])[1]
${Select_Model_Portfolio}    //md-select[@aria-haspopup="listbox"]
${Restruct_Option}    //span[contains(text(),"Restructure")]//..//..//div//div[@class='md-off']
${Fund_Replacement_Checkbox_1}    (//div[@class="md-icon"])[2]
${Change_Select_Funds_Button}    //span[contains(text(),"Change selected funds")]
${Percentage_Area_1}    (//input[@ng-model="fund.newPercent"])[2]
${Percentage_Area_2}    (//input[@ng-model="fund.newPercent"])[1]
${Save_Button_CGWM}    //button[@ng-disabled="!$ctrl.canSave()"]
${Yes_Checkbox}     //span[contains(text(),"Yes")]
${Sign_Now_Button}    //a[@aria-label='Sign Now']


*** Keywords ***

Switch company

    Sleep    5s
    Wait Until Element Is Enabled    ${CGWM_Company}    10s
    Click Element    ${CGWM_Company}
    Log To Console    Change company to CGWM Model Portfolio Management Portal - staging

Go to External Asset Management

    Sleep    3s
    Wait Until Element Is Enabled    ${External_Asset_Management}    10s
    Click Element    ${External_Asset_Management}
    Log To Console    Go to External asset management

Go to FH DFM portal

    Wait Until Element Is Enabled    ${FH_DFM_Portal}    10s
    Click Element    ${FH_DFM_Portal}
    Log To Console    Go to FH DFM portal

Open new instruction page
    Wait Until Element Is Enabled    ${Create_Instruction}    45s
    Click Element    ${Create_Instruction}
    Log To Console    Clicked on crate instuction button

Edit Information in welcome page

    Wait Until Element Is Enabled    ${Model_Portfolio_Implemantaion}    150s
    Click Element    ${Model_Portfolio_Implemantaion}
    Log To Console    Model portfolio implemantaion selected.

Click on next button

    Wait Until Element Is Enabled    ${Next_Button_CGWM}    30s
    Click Element    ${Next_Button_CGWM}
    Log To Console    Clicked on next button

Change target percentage

    Wait Until Element Is Enabled    ${Percentage_Area_1}    10s
    Scroll Element Into View    ${Percentage_Area_1}
    Input Text    ${Percentage_Area_1}    5
    Wait Until Element Is Enabled    ${Percentage_Area_2}    10s
    Scroll Element Into View    ${Percentage_Area_2}
    Input Text    ${Percentage_Area_2}    30
    Log To Console    Individual percentage changed
    Wait Until Element Is Enabled    ${Save_Button_CGWM}    10s
    Click Element    ${Save_Button_CGWM}
    Log To Console    Clicked on save button

Edit information on model portfolio implemantaion

    Sleep    10s
    Wait Until Element Is Enabled    ${Select_Model_Portfolio}    30s
    Click Element    ${Select_Model_Portfolio}
    Log To Console    Model portfolio is selected.
    Scroll Element Into View    (//md-option[@role="option"])[14]
    Click Element    (//md-option[@role="option"])[14]
    Wait Until Element Is Enabled    ${Restruct_Option}
    Click Element    ${Restruct_Option}
    Change target percentage
    Wait Until Element Is Enabled    ${Yes_Checkbox}    10s
    Click Element    ${Yes_Checkbox}
    Log To Console    Yes checkbox selected

Fill up second pair of eyes page

    Sleep    10s
    Wait Until Element Is Enabled    ${Select_Model_Portfolio}    30s
    Click Element    ${Select_Model_Portfolio}
    Log To Console    Model portfolio is selected.
    Scroll Element Into View    (//md-option[@role="option"])[11]
    Click Element    (//md-option[@role="option"])[11]

Create new instruction

    Open new instruction page
    Edit Information in welcome page
    Click on next button
    Edit information on model portfolio implemantaion
    Click on next button
    Fill up second pair of eyes page
    Click on next button

Sign document on second account

    Wait Until Element Is Enabled    ${Sign_Now_Button}    10s
    Click Element    ${Sign_Now_Button}