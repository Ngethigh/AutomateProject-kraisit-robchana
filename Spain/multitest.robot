*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    DateTime
Library    String
Library    Collections

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
${LOG_FILE}             test_results.log

# --- Locators ---
${USERNAME_FIELD}       id:email
${PASSWORD_FIELD}       id:password
${SIGN_IN_BUTTON}       xpath=//button[@type='submit' and contains(text(), 'Sign In')]
${ERROR_ALERT}          css:div.alert.alert-error
${DASHBOARD_ELEMENT}    xpath=//*[contains(text(),'Dashboard') or contains(@class,'dashboard')]

*** Keywords ***
Setup Test Suite
    Create Directory    ${SCREENSHOT_DIR}
    ${separator}=    Set Variable    ${50 * '='}
    Create File    ${LOG_FILE}    Robot Framework Login Test Results\n${separator}\n
    ${current_time}=    Get Current Date
    Append To File    ${LOG_FILE}    Start Time: ${current_time}\n\n

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

Log Result To File
    [Arguments]    ${run_num}    ${scenario}    ${start_time}    ${duration}    
    ...            ${user}    ${pass}    ${expected}    ${status}    ${screenshot}    ${message}
    
    ${separator}=    Set Variable    ${50 * '-'}
    ${log_entry}=    Catenate    SEPARATOR=\n    \
    ...    Run Number: ${run_num}    \
    ...    Scenario: ${scenario}    \
    ...    Start Time: ${start_time}    \
    ...    Duration: ${duration} seconds    \
    ...    Username: ${user}    \
    ...    Password: ${pass}    \
    ...    Expected: ${expected}    \
    ...    Result: ${status}    \
    ...    Message: ${message}    \
    ...    Screenshot: ${screenshot}    \
    ...    ${separator}
    
    Append To File    ${LOG_FILE}    ${log_entry}\n
    Log To Console    ${log_entry}

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
        ${end_time}=    Get Current Date
        ${duration}=    Subtract Date From Date    ${end_time}    ${start_time}
        Log Result To File    ${run_num}    ${expected_outcome}    ${start_time}    
        ...    ${duration}    ${user}    ${pass}    ${expected_outcome}    ${status}    ${screenshot}    ${error_msg}
        Close Browser
    END

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
        ...    Log To Console    ล็อกอินสำเร็จล้มเหลวในรอบที่ ${run_num}
        
        # Scenario 2: ชื่อผู้ใช้ผิด
        ${run_path_invalid_user}=    Setup Run Directory    ${run_num}    INVALID_USER
        ${status}=    Run Keyword And Return Status    
        ...    Perform Login And Verify    ${run_num}    ${run_path_invalid_user}    
        ...    ${INVALID_USERNAME}    ${VALID_PASSWORD}    FAIL
        IF    not ${status}    
        ...    Log To Console    ชื่อผู้ใช้ผิดล้มเหลวในรอบที่ ${run_num}
        
        # Scenario 3: รหัสผ่านผิด
        ${run_path_invalid_pass}=    Setup Run Directory    ${run_num}    INVALID_PASS
        ${status}=    Run Keyword And Return Status    
        ...    Perform Login And Verify    ${run_num}    ${run_path_invalid_pass}    
        ...    ${VALID_USERNAME}    ${INVALID_PASSWORD}    FAIL
        IF    not ${status}    
        ...    Log To Console    รหัสผ่านผิดล้มเหลวในรอบที่ ${run_num}
    END
    
    # สรุปผลการทดสอบ
    Log To Console    \n\nการทดสอบเสร็จสิ้น
    Log To Console    ผลลัพธ์ถูกบันทึกใน: ${LOG_FILE}
    Log To Console    Screenshots ถูกบันทึกใน: ${SCREENSHOT_DIR}
