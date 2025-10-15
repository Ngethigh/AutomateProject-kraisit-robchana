*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    DateTime
Library    String
Library    Collections
Library    excel_logger.py
Library    ImapLibrary2

Suite Setup       Setup Test Suite

*** Variables ***
# --- ข้อมูลการทดสอบ ---
${URL}                  https://sellin.ox-shop.com/user/login
${BROWSER}              Chrome
${REPEAT_COUNT}         1

# --- ข้อมูลล็อกอิน ---
${VALID_USERNAME}       admin
${VALID_PASSWORD}       AdminSpainIT$%$@!@2025
${INVALID_USERNAME}     user_that_does_not_exist
${INVALID_PASSWORD}     WrongPassword1234!

# --- ไฟล์และโฟลเดอร์ ---
${SCREENSHOT_DIR}       screenshots_results
${EXCEL_REPORT_FILE}    Spain_Login_Test_Report.xlsx

# --- Locators ---
${USERNAME_FIELD}       id:email
${PASSWORD_FIELD}       id:password
${SIGN_IN_BUTTON}       xpath=//button[@type='submit' and contains(text(), 'Sign In')]
${ERROR_ALERT}          css:div.alert.alert-error
${DASHBOARD_ELEMENT}    xpath=//*[contains(text(),'Dashboard') or contains(@class,'dashboard')]

*** Keywords ***
Setup Test Suite
    Create Directory    ${SCREENSHOT_DIR}
    @{header}=    Create List    Run Number    Scenario    Start Time    Duration (s)    Username    Password    Expected Outcome    Actual Result    Screenshot Path
    excel_logger.setup_report    ${EXCEL_REPORT_FILE}    ${header}


Setup Run Directory
    [Arguments]    ${run_num}    ${scenario_name}
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${run_path}=    Catenate    SEPARATOR=/    ${SCREENSHOT_DIR}    Run_${run_num}_${scenario_name}_${timestamp}
    Create Directory    ${run_path}
    RETURN    ${run_path}

Handle Login Success
    [Arguments]    ${run_path}
    Wait Until Page Does Not Contain Element    ${SIGN_IN_BUTTON}    timeout=15s
    Wait Until Page Contains Element    ${DASHBOARD_ELEMENT}    timeout=15s
    ${screenshot}=    Capture Page Screenshot    filename=${run_path}/01_Login_Success.png
    RETURN    PASS    ${screenshot}    "ล็อกอินสำเร็จและพบหน้า Dashboard"

Handle Login Failure
    [Arguments]    ${run_path}
    Wait Until Element Is Visible    ${ERROR_ALERT}    timeout=10s
    ${actual_text}=    Get Text    ${ERROR_ALERT}
    ${screenshot}=    Capture Page Screenshot    filename=${run_path}/01_Login_Failed.png
    
    IF    "Username or password is invalid!" in "${actual_text}"
        RETURN    PASS    ${screenshot}    "แสดงข้อความผิดพลาดถูกต้อง: ${actual_text}"
    ELSE
        RETURN    FAIL    ${screenshot}    "ข้อความผิดพลาดไม่ตรง预期: ${actual_text}"
    END

Perform Login And Verify
    [Arguments]    ${run_num}    ${run_path}    ${user}    ${pass}    ${expected_outcome}
    ${start_time}=    Get Current Date
    ${status}=    Set Variable    FAIL
    ${error_msg}=    Set Variable    ไม่มีข้อความแสดงผล
    ${screenshot}=    Set Variable    N/A

    TRY
        Open Browser    ${URL}    ${BROWSER}
        Maximize Browser Window
        
        # ตรวจสอบหน้า Login
        Wait Until Page Contains Element    ${SIGN_IN_BUTTON}    timeout=10s
        
        # กรอกข้อมูลและล็อกอิน
        Input Text    ${USERNAME_FIELD}    ${user}
        Input Password    ${PASSWORD_FIELD}    ${pass}
        Click Button    ${SIGN_IN_BUTTON}

        # ตรวจสอบผลลัพธ์
        IF    "${expected_outcome}" == "SUCCESS"
            ${status}    ${screenshot}    ${error_msg}=    Handle Login Success    ${run_path}
        ELSE
            ${status}    ${screenshot}    ${error_msg}=    Handle Login Failure    ${run_path}
        END

    EXCEPT    AS    ${err}
        ${error_msg}=    Set Variable    เกิดข้อผิดพลาด: ${err}
        ${screenshot}=    Capture Page Screenshot    filename=${run_path}/99_EXCEPTION.png
        ${status}=    Set Variable    FAIL
    FINALLY
        ${duration}=    Subtract Date From Date    ${Get Current Date}    ${start_time}
        Log Result To Excel    ${run_num}    ${expected_outcome}    ${start_time}    
        ...    ${duration}    ${user}    ${pass}    ${status}    ${screenshot}    ${error_msg}
        Close Browser
    END

Log Result To Excel
    [Arguments]    ${run_num}    ${scenario}    ${start_time}    ${duration}    
    ...            ${user}    ${pass}    ${expected}    ${status}    ${message}    ${screenshot}
    
    # แปลงข้อมูลให้ตรงกับหัวข้อ
    @{row_data}=    Create List
    ...    ${run_num}                  # Run Number
    ...    ${scenario}                # Scenario
    ...    ${start_time}              # Start Time
    ...    ${duration}                # Duration (s)
    ...    ${user}                    # Username
    ...    ${pass}                    # Password
    ...    ${expected}                # Expected
    ...    ${status}                  # Actual Result
    ...    ${message}                 # Message
    ...    ${screenshot}              # Screenshot Path
    
    Append Row    ${EXCEL_REPORT_FILE}    ${row_data}

*** Test Cases ***
Run All Login Scenarios Repeatedly
    [Documentation]    ทดสอบสถานการณ์ล็อกอิน 3 รูปแบบ
    
    FOR    ${i}    IN RANGE    ${REPEAT_COUNT}
        ${run_num}=    Evaluate    ${i} + 1
        
        # Scenario 1: ล็อกอินสำเร็จ
        ${run_path_success}=    Setup Run Directory    ${run_num}    SUCCESS
        ${status}=    Run Keyword And Return Status    
        ...    Perform Login And Verify    ${run_num}    ${run_path_success}    
        ...    ${VALID_USERNAME}    ${VALID_PASSWORD}    SUCCESS
        IF    not ${status}    
        ...    Log    ล็อกอินสำเร็จล้มเหลวในรอบที่ ${run_num}    level=WARN
        
        # Scenario 2: ชื่อผู้ใช้ผิด
        ${run_path_invalid_user}=    Setup Run Directory    ${run_num}    INVALID_USER
        ${status}=    Run Keyword And Return Status    
        ...    Perform Login And Verify    ${run_num}    ${run_path_invalid_user}    
        ...    ${INVALID_USERNAME}    ${VALID_PASSWORD}    INVALID_USER
        IF    not ${status}    
        ...    Log    ชื่อผู้ใช้ผิดล้มเหลวในรอบที่ ${run_num}    level=WARN
        
        # Scenario 3: รหัสผ่านผิด
        ${run_path_invalid_pass}=    Setup Run Directory    ${run_num}    INVALID_PASS
        ${status}=    Run Keyword And Return Status    
        ...    Perform Login And Verify    ${run_num}    ${run_path_invalid_pass}    
        ...    ${VALID_USERNAME}    ${INVALID_PASSWORD}    INVALID_PASS
        IF    not ${status}    
        ...    Log    รหัสผ่านผิดล้มเหลวในรอบที่ ${run_num}    level=WARN
    END