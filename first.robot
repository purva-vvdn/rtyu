*** Settings ***
Documentation   First Robot Program
Library     Collections
Library     Dialogs
Library    SeleniumLibrary
*** Variables ***
@{list1}    12    13    41    
@{list2}    22    45    58
@{list3}
&{dict}     name=sakshi    role=QA
${url}    https://www.amazon.com/
*** Test Cases ***
TC_001
    [Documentation]     This test case will add value to list1
    [Tags]      list
    Append To List    ${list1}    33
    Log    ${list1}
TC_002
    [Documentation]     This test case will add value to dict
    [Tags]      dict
    Set To Dictionary    ${dict}    location=noida
    Log    ${dict}
TC_003
    [Documentation]     This test case is for Dialog Library
    [Tags]   Dialog
    Pause Execution    test 123
    ${user_name}    Get Value From User     Enter your name:
    Log     The user name entered is : ${user_name}

    @{options}      Create List     Admin User Sanjeev
    ${role}     Get Selection From User     Select anything:    @{options}
    Log     Selected option is ${role}

TC_004
    [Documentation]    this test case is for collection library
    [Tags]    Combine
    Combine Lists        ${list1}    ${list2}
    Log    The combined list is ${list3}
    
TC_005
    [Tags]    Amazon
    Register To Amazon App
Open the browser
*** Keywords ***
Register to amazon app
    [Documentation]    Register to amazon app
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Mouse Over    //a[@id="nav-link-accountList"]
    Sleep     5
    Click Element    (//a[contains(text(),"Start here.")])[1]
    Sleep    5
    Input Text      xpath=//input[@id='ap_customer_name']    Sakshi
    Input Text      xpath=//input[@id='ap_email']    sakshi.guptavvdn@example.com
    Input Text      xpath=//input[@id='ap_password']    MySecurePassword123
    Input Text      xpath=//input[@id='ap_password_check']    MySecurePassword123
    sleep     5
    Click Button    xpath=//input[@id='continue']
    Sleep    5
    Click Element     xpath=//span[@class="a-size-medium a-color-base a-text-normal"]]
    Sleep    5

