*** Settings ***

Library    SeleniumLibrary    plugins=SeleniumTestability;False;29 seconds;False
Library    ../Library/CustomKeywords.py
Resource    ../Resources/PO/TabsPage.robot
Resource    ../Resources/PO/Deletion.robot
Resource    ../Resources/PO/LoginPage.robot
Resource    ../Resources/PO/CompanyUsers.robot


*** Variables ***

${FILENAME}    01_DOC.doc
${FolderName}
${UserIcon}    (//div[@class = 'picture-block'])[2]
${SignoutButton}    //span[text() = 'Sign out']
${HomeButton}    //span[contains(text(), 'Home')]//parent::translate//parent::button
${NewHomeButton}    //span[contains(text(), 'Home')]//parent::a
${NewDocumentsButton}    //span[contains(text(), 'Documents')]//parent::a
${chrome_options}
${Settings}    //a[@aria-label = 'Settings']
${Banner}  //span[text() = 'QA Staging']//parent::a


*** Keywords ***


Launch browser  [Arguments]    ${Environment}    ${Browser}

    open browser  ${Environment}    ${Browser}
    set window size    ${1400}    ${600}
    maximize browser window

Launch browser Headless    [Arguments]    ${Environment}

   ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome options}    add_argument    window-size\=1400,600
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    go to   ${Environment}
    sleep    3s

Logout

    sleep    2s
    wait until element is enabled    ${UserIcon}  45s
    click element    ${UserIcon}
    wait until element is enabled    ${SignoutButton}  45s
    sleep    1s
    click element    ${SignoutButton}

Scroll Down

    execute javascript    window.scrollTo(0,200)

Go To Home Page

    wait until element is enabled    ${HomeButton}    45s
    sleep    1s
    click element    ${HomeButton}

Switch To New Window

    switch window    NEW    15s

Switch to Main Window

    switch window    MAIN    15s

Click Banner

  Wait Until Element Is Enabled    ${Banner}
  sleep  3s
  Click Element    ${Banner}

Navigate to Settings

    wait until element is enabled    ${Settings}    45s
    sleep    2s
    click element    ${Settings}

Select an option under settings    [Arguments]    ${Options}

    wait until element is enabled    //div[text() = '${Options}']//parent::a  45s
    sleep    2s
    scroll element into view    //div[text() = '${Options}']//parent::a
    scroll down
    wait until keyword succeeds    2x    2s    click element    //div[text() = '${Options}']//parent::a

Navigate to Documents

    wait until element is enabled    ${NewDocumentsButton}    45s
    sleep    1s
    click element    ${NewDocumentsButton}

Remove Users    [Arguments]    ${Count}

     FOR  ${i}  IN RANGE    ${Count}
       Run Keyword If    ${Count>1}  Wait Until Element Is Enabled  (//button[@class = 'md-icon-button md-button md-default-theme md-ink-ripple'])[${Count}]
       sleep    2s
       Run Keyword If    ${Count>1}  Click Element  (//button[@class = 'md-icon-button md-button md-default-theme md-ink-ripple'])[${Count}]
       sleep    2s
       Run Keyword If    ${Count>1}  Wait Until Element Is Enabled  (//span[text() = 'Remove user']//parent::translate//parent::button)[${Count-1}]
       sleep    2s
       Run Keyword If    ${Count>1}  Click Element  (//span[text() = 'Remove user']//parent::translate//parent::button)[${Count-1}]
       sleep    2s
       Run Keyword If    ${Count>1}  Wait Until Element Is Enabled  //span[text() = 'Yes, delete']//parent::button
       sleep    2s
       Run Keyword If    ${Count>1}  Click Element  //span[text() = 'Yes, delete']//parent::button
       sleep    3s
       ${Count}    set variable    ${Count-1}
     END

Test Cleanup

     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='chrome'}    Launch browser Headless    ${Environment}
     Login with valid credentials    ${Email_address}    ${Password}
     Go To Home Page
#     Navigate to tabs    Documents
     Run Keyword And Continue On Failure   Delete the data(Folders)
     Navigate to Settings
     Select an option under settings    Company Users
     Wait Until Element Is Visible    //span[text() = 'OWNER']//parent::translate//parent::md-chip    15s
     sleep  3s
     ${Count}    get element count     (//button[@class = 'md-icon-button md-button md-default-theme md-ink-ripple'])
     Run Keyword If    ${Count>1}    Remove Users    ${Count}
     Close Browser
     Clear bin

Delete File/Folder from Bin  [Arguments]  ${count}

  FOR  ${i}  IN RANGE    ${count}
       Wait Until Element Is Enabled  (//button[@class = 'md-icon-button mds__document__itemOptionsIcon mds__document--darker-gray md-button md-default-theme md-ink-ripple hide-xs hide-sm'])[1]  45s
       sleep    2s
       Click Element  (//button[@class = 'md-icon-button mds__document__itemOptionsIcon mds__document--darker-gray md-button md-default-theme md-ink-ripple hide-xs hide-sm'])[1]
       sleep    2s
       Wait Until Element Is Enabled  //span[text() = 'Delete Forever']//parent::span//parent::button  45s
       sleep    2s
       Click Element  //span[text() = 'Delete Forever']//parent::span//parent::button
       sleep    2s
       Wait Until Element Is Enabled  //span[text() = 'Delete forever']//parent::button  45s
       sleep    2s
       Click Element  //span[text() = 'Delete forever']//parent::button
       sleep    10s
     END

Clear bin

     run keyword if    ${Browser=='chrome'}    Launch browser    ${Environment}    ${Browser}    ELSE IF    ${Browser=='headlesschrome'}    Launch browser Headless    ${Environment}
     Login with valid credentials    ${Email_address}    ${Password}
     Navigate to Side Pane    Bin
     Wait Until Element Is Enabled    (//button[@class = 'md-icon-button mds__document__itemOptionsIcon mds__document--darker-gray md-button md-default-theme md-ink-ripple hide-xs hide-sm'])  25s
     ${count}  Get Element Count  (//button[@class = 'md-icon-button mds__document__itemOptionsIcon mds__document--darker-gray md-button md-default-theme md-ink-ripple hide-xs hide-sm'])
     Run Keyword If    ${Count>=1}  Delete File/Folder from Bin    ${count}
     Close Browser
