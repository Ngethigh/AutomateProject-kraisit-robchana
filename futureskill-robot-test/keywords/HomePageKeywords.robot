*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot

*** Keywords ***
Open Future Skill Website
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Click Register Button
    Wait Until Page Contains Element    xpath=//button[contains(text(),'สมัครสมาชิก')]    timeout=10s
    Click Button    xpath=//button[contains(text(),'สมัครสมาชิก')]
