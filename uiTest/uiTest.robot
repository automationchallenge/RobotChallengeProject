*** Settings ***
Library  OperatingSystem
Library  Selenium2Library

*** Variables ***
${URL}    http://localhost:8080
${btnToUpload}      xpath=//*[@class="custom-file"]//child::input[@type="file"]
${btnToDispense}    css=a.btn.btn-danger.btn-block
${txtCashDispensed}     xpath=//div[@class="display-4 font-weight-bold"]
${inputFileName}    InputData.csv


*** Test Cases ***
As the Clerk, I should be able to upload a civ file to a portal so that I can populate the database from a UI
    Open Browser    ${url}      Chrome
    Scroll Element Into View        ${btnToUpload}
    Wait Until Element is visible       ${btnToUpload}    timeout=10s
    Set Focus To Element        ${btnToUpload}
    Click Button    ${btnToUpload}
    Choose File     ${btnToUpload}     .${CURDIR}\${inputFileName}


As the Bookkeeper, I should be able to query the amount of tax relief for each person in the database so that I can report the figures to my Bookkeeping Manager
    Open Browser    ${url}      Chrome
    Scroll Element Into View        ${btnToDispense}
    Wait Until Element is visible       ${btnToDispense}    timeout=5s
    Set Focus To Element        ${btnToDispense}
    ${Result}=      Page Should Contain Element     ${btnToDispense}
    ${bgcolor}=    Get Element Attribute     ${btnToDispense}   background-color
    Click Element     ${btnToDispense}
    Wait Until Element is visible       ${txtCashDispensed}   timeout=5s
    ${actualText}=    Get Text    ${txtCashDispensed}
    Log To Console    ${actualText}
    Should Be Equal As Strings  ${actualText}  Cash dispensed