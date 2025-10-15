*** Settings ***
Library    SeleniumLibrary
Library    ImapLibrary2
Library    String
Library    OperatingSystem
Library    DateTime
# Library    excel_logger.py     # หากยังไม่ได้ใช้ สามารถปิดไว้ก่อนได้
# Library    otp_utils.py        # หากยังไม่ได้ใช้ สามารถปิดไว้ก่อนได้

*** Variables ***
# --- ข้อมูลหลัก ---
${URL}                  https://sellin.ox-shop.com/user/login
${BROWSER}              Chrome
${USERNAME}             admin
${PASSWORD}             AdminSpainIT$%$@!@2025

# --- ข้อมูล Gmail ---
${GMAIL_USERNAME}       ksrc034@gmail.com
${GMAIL_APP_PASSWORD}   harjbbxtomhigkvh

# --- การตั้งค่าอื่นๆ ---
${SCREENSHOT_DIR}       screenshotsx
${REPEAT_COUNT}         1

# --- Locators ---
${USERNAME_FIELD}       id:email
${PASSWORD_FIELD}       id:password
${SIGN_IN_BUTTON}       xpath=//button[@type='submit' and contains(text(), 'Sign In')]

*** Test Cases ***
Login With Valid Credentials
    [Tags]    Login
    Open And Navigate To Login Page
    Input Username    ${USERNAME}
    Enter Password    ${PASSWORD}
    Click Sign In Button
    Verify Login Was Successful    # ต้องสร้าง Keyword นี้ต่อเพื่อตรวจสอบว่า Login สำเร็จจริง
    [Teardown]    Close Browser

*** Keywords ***
Open And Navigate To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${USERNAME_FIELD}    timeout=10s

Input Username
    [Arguments]    ${user}
    Input Text    ${USERNAME_FIELD}    ${user}

Enter Password
    [Arguments]    ${pass}
    Input Password    ${PASSWORD_FIELD}    ${pass}

Click Sign In Button
    Click Button    ${SIGN_IN_BUTTON}

Verify Login Was Successful
    Wait Until Page Contains    Dashboard    timeout=10s
    Log    Login successful!

    # --- ส่วนที่เพิ่มเข้ามาตามที่คุณต้องการ ---
    Log To Console    Waiting for 5 seconds...
    Sleep    5s

    Log To Console    Capturing page screenshot...
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    Capture Page Screenshot    filename=${SCREENSHOT_DIR}/login_success_${timestamp}.png