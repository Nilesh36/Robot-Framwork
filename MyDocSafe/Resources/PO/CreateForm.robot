*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Resource   ../../Resources/PO/PortalLiveChat.robot
Library    ../../Library/CustomKeywords.py
Resource   ../../Resources/PO/DocumentsPage.robot
Resource   ../../Resources/Common.robot

*** Variables ***

${FormTemplatesTab}    //a[@aria-label = 'Form templates']
${AddFormButton}    //span[text() = 'Add Form'] //parent::translate//parent::a
${FormNameTextBox}    //input[@ng-model = 'vm.form.name']
${AskforSignatureBar}    (//div[@class = 'md-thumb md-ink-ripple'])[1]
${SendNotificationsBar}    (//div[@class = 'md-thumb md-ink-ripple'])[2]
${CreateFormButton}    //span[text() = 'Create form'] //parent::translate//parent::span
${BackToDocumentsButton}    //span[text() = 'Back to documents'] //parent::translate//parent::button
${ShortTextInputTextBox}    //input[@ng-model = 'element.label']
${StaticTextInputBox}    //div[contains(@title, 'Rich Text Editor')]/p
${EmailTextInputBox}    //input[@ng-model = 'element.label']
${NumberTextInputBox}    //input[@ng-model = 'element.label']
${DateTextInputBox}    //input[@ng-model = 'element.label']
${LongTextInputBox}    //input[@ng-model = 'element.label']
${FormsButton}    //span[text() = 'Form']//parent::span//parent::button
${OkButton}    //span[text() = 'OK']//parent::translate//parent::button
${PreviewButton}    //span[text() = 'Preview']//parent::translate//parent::button
${ShortTextAnswerTextBox}    //div[contains(text(), 'Short text')]//parent::div/md-input-container/input
${EmailAnswerTextBox}    //div[contains(text(), 'Please enter your email')]//parent::div/md-input-container/input
${NumberAnswerTextBox}    //div[contains(text(), 'Number')]//parent::div/md-input-container/input
${DateAnswerTextBox}    //div[contains(text(), 'Date?')]//parent::div/md-input-container/md-datepicker/div/input
${LongTextAnswerTextBox}    //div[contains(text(), 'Long Text?')]//parent::div/md-input-container/div/textarea
${Submitform}    //span[text() = 'Submit']//parent::translate//parent::button
${AnswersSubmissionMessage}    //span[text() = 'Your answers have been submitted.']
${RecordsTab}    //span[text() = 'Records']//parent::translate//parent::a
${OptionstoViewForm}    (//button[@ng-click = '$mdMenu.open()'])[2]
${ViewButton}    //span[text() = 'View']//parent::translate//parent::button
${CheckBoxInput}    //input[@ng-model = 'element.label']
${CheckBoxOption}    //input[@placeholder = 'Option 1']
${AddOptionButton}    //span[text() = 'Add option']//parent::translate//parent::a
${MultiplechoiceInputBox}    //input[@ng-model = 'element.label']
${AddOtherOptionButton}    //traslate[contains(text(), 'Other')]//parent::a
${YesNoInputTextBox}    //input[@ng-model = 'element.label']
${OtherTextBox}    //input[@placeholder= 'Other:']
${AddFileUpload}    //input[@ng-model = 'vm.answers[element.id]']
${VideoQuestionTextBox}    //input[@ng-model = 'element.label']
${VideoURLTextBox}    //input[@ng-model = 'element.value']
${VideoURL}    https://www.youtube.com/watch?v=muUqCQ9qopo
${CountryAutoFieldTextBox_1}    (//input[@id = 'mds-country-autocomplete'])[1]
${StreetTextBox}    //input[@ng-model = 'vm.answers[element.id].street']
${BuildingNumberTextBox}  //input[@ng-model = 'vm.answers[element.id].buildingNumber']
${PostalCodeTextBox}    //input[@ng-model = 'vm.answers[element.id].postcode']
${TelephoneTextBox}    //input[@type = 'tel']
${CountryAutoFieldTextBox_2}    (//input[@id = 'mds-country-autocomplete'])[2]
${CityTextBox}    //input[@ng-model = 'vm.answers[element.id].town']
${StateTextBox}    //input[@ng-model = 'vm.answers[element.id].state']

*** Keywords ***

Navigate to Form Templates

    wait until element is enabled    ${FormTemplatesTab}  45s
    click element    ${FormTemplatesTab}

Click Form button

    wait until element is enabled    ${Formsbutton}  45s
    sleep    1s
    click element    ${Formsbutton}

Click Add Form Button

    sleep    1s
    wait until element is enabled    ${AddFormButton}    45s
    sleep    1s
    click element    ${AddFormButton}

Enter Form Name

    sleep    3s
    wait until element is enabled    ${FormNameTextBox}  45s
    clear element text    ${FormNameTextBox}
    ${FormName}    randomword
    input text    ${FormNameTextBox}    ${FormName}
    [Return]    ${FormName}

Click Form Attributes    [Arguments]    ${AttributeName}

    wait until element is enabled    //span[text() = '${AttributeName}']//parent::span//parent::a  45s
    click element    //span[text() = '${AttributeName}']//parent::span//parent::a

Enable Ask for Signature

    sleep    1s
    wait until element is enabled    ${AskforSignatureBar}  45s
    click element    ${AskforSignatureBar}

Enable Notification

    wait until element is enabled    ${SendNotificationsBar}  45s
    click element   ${SendNotificationsBar}

Add text to Static text    [Arguments]    ${StaticText}

    wait until element is enabled    ${StaticTextInputBox}  45s
    input text    ${StaticTextInputBox}    ${StaticText}

Add text to Short text    [Arguments]    ${text}

    wait until element is enabled    ${ShortTextInputTextBox}  45s
    input text    ${ShortTextInputTextBox}    ${text}

Email Question

    wait until element is enabled    ${EmailTextInputBox}  45s

Add text to Number    [Arguments]    ${text}

    wait until element is enabled    ${NumberTextInputBox}  45s
    input text    ${ShortTextInputTextBox}    ${text}

Add text to Date    [Arguments]    ${text}

    wait until element is enabled    ${DateTextInputBox}  45s
    input text    ${DateTextInputBox}    ${text}

Add text to Long text    [Arguments]    ${text}

    wait until element is enabled    ${LongTextInputBox}  45s
    input text    ${LongTextInputBox}    ${text}

Add text to Check Box    [Arguments]    ${text}

    wait until element is enabled    ${CheckBoxInput}  45s
    input text    ${CheckBoxInput}    ${text}

Add text to Video    [Arguments]    ${text}

    wait until element is enabled    ${VideoQuestionTextBox}  45s
    input text    ${VideoQuestionTextBox}    ${text}

Add Value to Video

    wait until element is enabled    ${VideoURLTextBox}  45s
    input text    ${VideoURLTextBox}    ${VideoURL}

Add Options to TextBox    [Arguments]    ${Number}    ${Option}

    wait until element is enabled    //input[@placeholder = 'Option ${Number}']  45s
    input text    //input[@placeholder = 'Option ${Number}']    ${Option}

Click Add Option Button

    wait until element is enabled    ${AddOptionButton}  45s
    click element    ${AddOptionButton}

Add text to Multiple Choice    [Arguments]    ${text}

    wait until element is enabled    ${MultiplechoiceInputBox}  45s
    input text    ${MultiplechoiceInputBox}    ${text}

Add text to Yes/No    [Arguments]    ${text}

    wait until element is enabled    ${CheckBoxInput}  45s
    input text    ${CheckBoxInput}    ${text}

Add Options to Multiplechoices    [Arguments]    ${Number}    ${Option}

    sleep    1s
    wait until element is enabled    //input[@placeholder = 'Option ${Number}']  45s
    input text    //input[@placeholder = 'Option ${Number}']    ${Option}

Click Add Other option

    wait until element is enabled    ${AddOtherOptionButton}  45s
    click element    ${AddOtherOptionButton}


Click Create Form Button

    sleep    1s
    wait until element is enabled    ${CreateFormButton}  45s
    click element    ${CreateFormButton}

Click Back To Documents Button

    Sleep    2s
    wait until element is enabled    ${BackToDocumentsButton}  45s
    click element    ${BackToDocumentsButton}

Click Ok Button

     wait until element is enabled    ${OkButton}  45s
     click element    ${OkButton}
     Sleep    1s

Click Preview Button

    wait until element is enabled    ${PreviewButton}    45s
    click element    ${PreviewButton}

Enter Answer    [Arguments]    ${Locator}    ${Answer}

    wait until element is enabled  ${Locator}    45s
    input text    ${Locator}    ${Answer}
    sleep    1s

Click Submit

    wait until element is enabled    ${Submitform}  45s
    click element    ${Submitform}

Verify submission message

    wait until element is enabled    ${AnswersSubmissionMessage}  45s
    capture page screenshot    Answers_Submission.png

Navigate to Records Tab

    wait until element is enabled    ${recordstab}  45s
    click element    ${recordstab}
    sleep    5s

View form

    wait until element is enabled    ${OptionstoViewForm}  45s
    click element    ${OptionstoViewForm}
    Sleep    1s
    wait until element is enabled    ${ViewButton}  45s
    click element    ${ViewButton}

Form Preview

    Click Preview Button
    Switch To New Window

Choose CheckBox    [Arguments]    ${CheckBoxName}

    wait until element is enabled    //md-checkbox[@aria-label = '${CheckBoxName}']/div[1]    45s
    click element    //md-checkbox[@aria-label = '${CheckBoxName}']/div[1]


Choose Multiple choice    [Arguments]    ${MultipleChoiceName}

    wait until element is enabled    //md-radio-button[@aria-label = '${MultipleChoiceName}']/div[1]  45s
    click element    //md-radio-button[@aria-label = '${MultipleChoiceName}']/div[1]

Enter Answer in Other    [Arguments]    ${Text}

    wait until element is enabled    ${OtherTextBox}  45s
    input text    ${OtherTextBox}    ${Text}

Choose Yes/No    [Arguments]    ${Yes/No}

    wait until element is enabled    //md-radio-button[@aria-label = '${Yes/No}']/div[1]  45s
    click element    //md-radio-button[@aria-label = '${Yes/No}']/div[1]

Add File to Please add file    [Arguments]    ${FILENAME}

    wait until element is visible    ${AddFileUpload}     45s
    sleep    3s
    input text    ${AddFileUpload}    ${CURDIR}${/}${FILENAME}

Choose Country_address    [Arguments]    ${CountryName}

    wait until element is enabled    ${CountryAutoFieldTextBox_1}  45s
    input text    ${CountryAutoFieldTextBox_1}    ${CountryName}
    sleep    1s
    press keys    ${CountryAutoFieldTextBox_1}    ARROW_DOWN
    sleep    1s
    press keys    ${CountryAutoFieldTextBox_1}    ENTER

Choose Country_Form   [Arguments]    ${CountryName}

    wait until element is enabled    ${CountryAutoFieldTextBox_1}  45s
    input text    ${CountryAutoFieldTextBox_2}    ${CountryName}
    sleep    1s
    press keys    ${CountryAutoFieldTextBox_2}    ARROW_DOWN
    sleep    1s
    press keys    ${CountryAutoFieldTextBox_2}    ENTER


Enter Building Number    [Arguments]    ${BuildingNumber}

    wait until element is enabled    ${BuildingNumberTextBox}  45s
    input text    ${BuildingNumberTextBox}    ${BuildingNumber}

Enter Street    [Arguments]    ${Street}

    wait until element is enabled    ${StreetTextBox}  45s
    input text    ${StreetTextBox}    ${Street}

Enter City    [Arguments]    ${City}

    wait until element is enabled    ${CityTextBox}  45s
    input text    ${CityTextBox}    ${City}

Enter State    [Arguments]    ${State}

    wait until element is enabled    ${StateTextBox}  45s
    input text    ${StateTextBox}    ${State}

Enter Postalcode    [Arguments]    ${PostalCode}

    wait until element is enabled    ${PostalCodeTextBox}  45s
    input text    ${PostalCodeTextBox}    ${PostalCode}

Enter Phone    [Arguments]    ${Phone}

    wait until element is enabled    ${TelephoneTextBox}  45s
    input text    ${TelephoneTextBox}    ${Phone}


