*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot

*** Keywords ***
Fill Registration Form
    Wait Until Element Is Visible    name=email    timeout=10s
    Input Text    name=email    ${email}
    Input Text    name=firstName    ${FirstNAME}
    Input Text    name=lastName     ${LastName}
    Input Text    name=phoneNumber  ${Phone}
    Input Text    name=newPassword  ${PASSWORD}
    Input Text    name=confirmPassword    ${APPASSWORD}

Submit Registration
    Wait Until Page Contains Element    name=consent    timeout=10s
    Click Element    name=consent
    Click Button    xpath=//button[contains(text(),'สมัครสมาชิก')]

Verify OTP Page
    Wait Until Page Contains    ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์    timeout=10s
