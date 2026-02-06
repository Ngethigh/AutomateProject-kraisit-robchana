*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://futureskill.co/
${BROWSER}         chrome
${email}           robchanakrasit@gmail.com    # เปลี่ยนเป็นอีเมลของคุณ
${FirstNAME}       kraisit
${LastName}        robchana
${Phone}           0647938698    # เปลี่ยนเป็นเบอร์ของคุณ
${PASSWORD}        Koon12345
${APPASSWORD}      Koon12345

*** Test Cases ***
Register Future Skill Member
    [Documentation]    Test case for registering a new member on Future Skill
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    # Step 2: Click "Register" button - The text might need adjustment based on actual DOM, usually "สมัครสมาชิก"
    # Assuming the button contains text "สมัครสมาชิก"
    Wait Until Page Contains Element    xpath=//button[contains(text(),'สมัครสมาชิก')]    timeout=10s
    Click Button    xpath=//button[contains(text(),'สมัครสมาชิก')]

    # Step 3: Fill Registration Form
    # Using generic locators, these might need adjustment based on the actual site structure
    Wait Until Element Is Visible    name=email    timeout=10s
    Input Text    name=email    ${email}
    
    Input Text    name=firstName    ${FirstNAME}
    Input Text    name=lastName     ${LastName}
    Input Text    name=phoneNumber  ${Phone}
    Input Text    name=newPassword  ${PASSWORD}
    Input Text    name=confirmPassword    ${APPASSWORD}

    # Step 4: Click Accept Terms and Submit
    # Checkbox for terms - assuming interaction is needed
    # Sometimes custom checkboxes need click on label or specific div
    Wait Until Page Contains Element    name=consent    timeout=10s
    Click Element    name=consent
    
    Click Button    xpath=//button[contains(text(),'สมัครสมาชิก')]

    # Step 5: Verify OTP Page
    Wait Until Page Contains    ระบบได้ส่งรหัส OTP ไปยังเบอร์โทรศัพท์    timeout=10s
    
    [Teardown]    Close Browser
