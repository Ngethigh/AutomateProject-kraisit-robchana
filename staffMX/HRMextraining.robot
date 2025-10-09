*** Settings ***
Library    SeleniumLibrary
Library    ImapLibrary2
Library    String
Library    OperatingSystem
Library    DateTime

*** Variables ***
${BROWSER}                 Chrome
${URL}                     https://oway-x-mex-training.possefy.co.th/
${USERNAME}                99901
${PASSWORD}                AdminMXITTraining@!@2025
${STAFF_MENU}              xpath=//span[normalize-space(.)="Staff"]
${STAFF_CREATE}            xpath=//a[contains(@href,"/staff/create")]
${OTP_PAGE_IDENTIFIER}     xpath=//h5[text()='Send OTP With Email']
# ✅ เปลี่ยน locator ให้คลิกที่ <a> โดยตรง
${BACKOFFICE_STAFF_BTN}    xpath=//a[contains(@href,'/staff/create/backoffice')]

${LOGIN_USERNAME_FIELD}    id:username
${LOGIN_PASSWORD_FIELD}    id:password
${LOGIN_BUTTON}            id:logged
${OTP_EMAIL_OPTION}        xpath=//span[contains(@class,'radio-label') and contains(.,'@oppo-oway.com')]
${SEND_CODE_BTN}           id:send_code
${OTP_INPUT_FIELD_LIST}    css:input[name="otp_code[]"]
${otp_code}                777777
${OTP_SUBMIT_BUTTON}       id:submit_button
${SUCCESS_MODAL}           xpath=//div[contains(@class,'swal2-popup')]//h2[text()='Success!']
${SUCCESS_OK_BUTTON}       css:button.swal2-confirm
${LASTNAME_FIELD}          id=lastname
${LASTNAME_VALUE}          RonaldoTestt
${FIRSTNAME_FIELD}         id=firstname
${FIRSTNAME_VALUE}         CristianTest
${ChinaNAME_FIELD}         id=chinese_name
${ChinaNAME_VALUE}         语言

${EMAIL_FIELD}             id=email
${EMAIL_Value}             emailfortesting@gmail.com
${Phone_FIELD}             id=phone_number
${Phone_Value}             0991116274
${HRR_FIELD}               id=household_register
${HRR_Value}               HHRTest01
${SSP_FIELD}               id=social_security_place
${SSP_Value}               SSP001Test
${CA_FIELD}                id=current_address
${CA_Value}                110TestAddress
${ID_FIELD}                id=card_id
${ID_Value}                777667766777
${BD_FIELD}                id=birthdate
${BD_Value}                12/09/2025
${JO_FIELD}                id=joined_at
${JO_Value}                12/09/2025
${RD_FIELD}                regularization_date
${RD_Value}                25/09/2025
${PROBA_FIELD}             id=probation_days
${PROBA_Value}             13
${NEXT_BUTTON}             xpath=//button[@class='btn waves-effect waves-light cyan darken-1 next-step' and @id='basic']
${Next_EDU}                xpath=//button[@class='btn waves-effect waves-light cyan darken-1 next-step' and @id='edu']
${Next_EXP}                xpath=//button[@class='btn waves-effect waves-light cyan darken-1 next-step' and @id='work']
${Next_Salary}             xpath=//button[@class='btn waves-effect waves-light cyan darken-1 next-step' and @id='salary']
${Next_Other}              xpath=//button[@class='btn waves-effect waves-light cyan darken-1 next-step' and @id='other']
${Next_Docs}               xpath=//button[@class='btn waves-effect waves-light cyan darken-1 next-step' and @id='hiring_document']
${Save}                    xpath=//button[@class='btn waves-effect waves-light green darken-1 save-step' and @id='agent']
${SLY_FIELD}               id=salary
${SLY_Value}               2500
${KPI_FIELD}               id=kpi
${KPI_Value}               49955
${Allow_FIELD}             id=allowance
${Allow_Value}             5005000151   
${Taxno_FIELD}             id=tax_number            
${Taxno_Value}             9909901351   
${Curp_FIELD}              id=curp
${Curp_Value}              9909901351   
${TaxAdd_FIELD}            id=tax_zipcode                    
${TaxAdd_Value}            9909901351 
${Insuno_FIELD}            id=insurance_number                
${Insuno_Value}            9909901351 
${IDcard_FIELD}            id=id_card                
${IDcard_Value}            9909901351     
${BankAcc_FIELD}           id=bank_account                              
${BankAcc_FValue}          9909901351 
${BankNo_FIELD}            id=bank_account_number                  
${BankNo_Value}            9909901351 
${Father_Field}            id=father_name
${Father_Value}            DaddyTest
${Mother_Field}            id=mother_name
${Mother_Value}            MommyTest
${WorkTool_Field}          id=work_tool
${WorkTool_Value}          Azana
${Activity_Field}          id=activity_develop
${Activity_Value}          Football
${WorkingS_Field}          id=working_schedule_hour
${WorkingS_Value}          80
${Time_Field}              id=time_service
${Time_Value}              8
${WorkLocate_Field}        id=street_work_location
${WorkLocate_Value}        StreetTest
${ExNowork_Field}          id=external_work_location
${ExNowork_Value}          222225
${InNowork_Field}          id=internal_work_location
${InNowork_Value}          222225
${NBhood_Field}            id=neighborhood_work_location
${NBhood_Value}            222225
${ZipCode_Field}           id=zipcode_work_location
${ZipCode_Value}           58120
${Muni_Field}              id=municipality_work_location
${Muni_Value}              222225
${SWL_Field}               id=state_work_location
${SWL_Value}               222225
${EmployAdd_Field}         id=street_employee_address
${EmployAdd_Value}         222225
${ExEmployAdd_Field}       id=external_employee_address
${ExEmployAdd_Value}       222225
${InEmployAdd_Field}       id=internal_employee_address
${InEmployAdd_Value}       222225
${NBhoodEmAdd_Field}       id=neighborhood_employee_address
${NBhoodEmAdd_Value}       222225
${ZipCodeEmAdd_Field}      id=zipcode_employee_address
${ZipCodeEmAdd_Value}      222225
${MuniEmAdd_Field}         id=municipality_employee_address
${MuniEmAdd_Value}         222225
${NoInfo_Field}            id=credit_number
${NoInfo_Value}            222225
${EmerCont_Field}          id=em_contact_name
${EmerCont_Value}          EmerTesting
${EmerContPhone_Field}     id=em_contact_ph
${EmerContPhone_Value}     0944222225
${File1}                   id=file1
${File2}                   id=file2
${File3}                   id=file3
${File4}                   id=file4
${File5}                   id=file5
${File6}                   id=file6
${File7}                   id=file7
${File8}                   id=file8
${File9}                   id=file9
${File10}                  id=file10
${File11}                  id=file11
${File12}                  id=file12
${AgentJoin}               id=complete_joined_date
${AgentJoinValue}          04/06/2025 
${SendAgent}               id=date_send_agent 
${SendAgentValue}          06/06/2025 
${ExpireDate}              id=date_expire_contract
${ExpireValue}             09/06/2025
${RemarkFill}              id=remark
${RemarkValue}             remarktest 

*** Keywords ***
Safe Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Scroll Element Into View         ${locator}
    # ลองคลิกปกติ 3 ครั้ง เผื่อโดน overlay/animation
    Wait Until Keyword Succeeds      3x    1.5s    Click Element    ${locator}

Js Click
    [Arguments]    ${locator}
    ${el}=    Get WebElement    ${locator}
    Execute Javascript    arguments[0].click();    ${el}

Click With Fallback
    [Arguments]    ${locator}
    Run Keyword And Ignore Error    Safe Click    ${locator}
    ${res_status}    ${res_msg}=    Run Keyword And Ignore Error    Element Should Be Visible    ${locator}
    # ถ้า element ยังอยู่แปลว่าคลิกไม่สำเร็จ ลอง JS click
    Run Keyword If    '${res_status}'=='FAIL'    Js Click    ${locator}

*** Test Cases ***
ล็อกอินเข้าสู่ระบบ HR ด้วย OTP Bypass
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN_USERNAME_FIELD}    15s
    Input Text    ${LOGIN_USERNAME_FIELD}    ${USERNAME}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${PASSWORD}
    Execute Javascript    document.getElementById('logged').click();
    Wait Until Page Contains Element    ${OTP_PAGE_IDENTIFIER}    20s
    Click Element   ${OTP_EMAIL_OPTION}
    Click Button    ${SEND_CODE_BTN}
    Sleep    2s

กรอก OTP ทีละช่องเหมือนมนุษย์
    @{otp_fields}=    Get WebElements    ${OTP_INPUT_FIELD_LIST}
    FOR    ${i}    IN RANGE    6
        Input Text    ${otp_fields}[${i}]    7
        Sleep    0.5s
    END
    Wait Until Element Is Enabled    ${OTP_SUBMIT_BUTTON}    15s
    Click Button    ${OTP_SUBMIT_BUTTON}
    Wait Until Element Is Visible    ${SUCCESS_MODAL}    15s
    Click Button    ${SUCCESS_OK_BUTTON}
    Sleep    1.5s

Verify Login Was Successful
    Wait Until Page Contains    Staff    10s
    Sleep    1.5s

Navigate To Create Staff
    Wait Until Element Is Visible    ${STAFF_MENU}    10s
    Click Element    ${STAFF_MENU}
    Wait Until Element Is Visible    ${STAFF_CREATE}    10s
    Click Element    ${STAFF_CREATE}
    Wait Until Location Contains    /staff/create    10s
    Sleep    1.5s

Click Backoffice Staff
    # ✅ ใช้ fallback (normal > js)
    Click With Fallback    ${BACKOFFICE_STAFF_BTN}
    # ถ้าไปหน้าถัดไปได้ URL จะมีคำว่า backoffice
    Wait Until Location Contains    /staff/create/backoffice/1    10s

Fill Lastname Field
    Log To Console    Waiting 3 seconds before filling lastname...
    Sleep    1.5s
    Wait Until Element Is Visible    ${LASTNAME_FIELD}    timeout=10s
    Input Text    ${LASTNAME_FIELD}    ${LASTNAME_VALUE}
    Log To Console    Filled lastname field with ${LASTNAME_VALUE}

Fill Firstname Field
    Log To Console    Waiting 3 seconds before filling lastname...
    Sleep    1.5s
    Wait Until Element Is Visible    ${FIRSTNAME_FIELD}    timeout=10s
    Input Text    ${FIRSTNAME_FIELD}    ${FIRSTNAME_VALUE}
    Log To Console    Filled lastname field with ${FIRSTNAME_VALUE}

Fill Chinese Name
    Log To Console    Waiting 3 seconds before filling lastname...
    Sleep    1.5s
    Wait Until Element Is Visible    ${ChinaNAME_FIELD}    timeout=10s
    Input Text    ${ChinaNAME_FIELD}    ${ChinaNAME_VALUE}
    Log To Console    Filled lastname field with ${ChinaNAME_VALUE}


Fill Gender And State
   # เลือก Gender - Male
    Log To Console    Waiting 3 seconds before filling Gender...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click Element    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='Male']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='Male']
    Log To Console    Selected Gender Male.
    Sleep    1.5s

# เลือก State - Aguascalientes
    Log To Console    Waiting 3 seconds before filling State...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click Element    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='- Aguascalientes -']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='- Aguascalientes -']
    Log To Console    Selected State Aguascalientes.

Fill Email Field
    Log To Console    Waiting 3 seconds before filling Email...
    Sleep    1.5s
    Wait Until Element Is Visible    ${EMAIL_FIELD}    timeout=10s
    Input Text    ${EMAIL_FIELD}    ${EMAIL_Value}
    Log To Console    Filled lastname field with ${EMAIL_Value}

Fill Phone Number Field
    Log To Console    Waiting 3 seconds before filling Phone...
    Sleep    1.5s
    Wait Until Element Is Visible    ${Phone_FIELD}    timeout=10s
    Input Text    ${Phone_FIELD}    ${Phone_Value}
    Log To Console    Filled lastname field with ${Phone_Value}

Select Organization And Position
    Log To Console    Waiting 1.5s For Process..
    Sleep    1.5s
    Scroll Element Into View    xpath=//div[@id='show-selected-department' and contains(text(), '- Select Department -')]
    Wait Until Element Is Visible    xpath=//div[@id='show-selected-department' and contains(text(), '- Select Department -')]    timeout=10s
    Click With Fallback    xpath=//div[@id='show-selected-department' and contains(text(), '- Select Department -')]
    Sleep    1.5s
    
    Wait Until Element Is Visible    xpath=//div[@data-value='1'][contains(text(), 'OPPO Mexico')]    timeout=10s
    Click With Fallback    xpath=//div[@data-value='1'][contains(text(), 'OPPO Mexico')]
    Wait Until Element Is Visible    xpath=//div[@data-dept='1' and @data-value='1,1' and contains(text(), 'Back Office')]    timeout=10s
    Click With Fallback    xpath=//div[@data-dept='1' and @data-value='1,1' and contains(text(), 'Back Office')]
    Sleep    1.5s
    
    Wait Until Element Is Visible    xpath=//span[contains(@class, 'select2-selection--single')]    timeout=10s
    Click With Fallback    xpath=//span[contains(@class, 'select2-selection--single')]
    Sleep    1.5s
    
 # รอให้ dropdown เปิดและแสดง options
    Wait Until Element Is Visible    css:.select2-results__options    timeout=10s

    Wait Until Element Is Visible    xpath=//li[contains(@class, 'select2-results__option') and text()='testing']    timeout=10s
    Click Element    xpath=//li[contains(@class, 'select2-results__option') and text()='testing']  
    Sleep    1.5s

Fill National
   # เลือก Gender - Male
    Log To Console    Waiting 2 seconds for Process...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click With Fallback    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='China']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='China']
    Log To Console    Selected Gender Algeria.
    Sleep    1.5s

Fill China 
    #เลือกข้อมูลของ China
    Log To Console    Waiting 2 seconds for Process...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click With Fallback    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='Beijing']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='Beijing']
    Log To Console    Selected Type Passport.
    Sleep    1.5s

    Log To Console    Waiting 3 seconds before process...
    Sleep    1.5s
    Wait Until Element Is Visible    ${HRR_FIELD}    timeout=10s
    Input Text    ${HRR_FIELD}    ${HRR_Value}
    Log To Console    Filled lastname field with ${HRR_Value}

    Log To Console    Waiting 2 seconds for Process...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click With Fallback    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='Han']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='Han']
    Log To Console    Selected Type Passport.
    Sleep    1.5s

    Log To Console    Waiting 3 seconds before process...
    Sleep    1.5s
    Wait Until Element Is Visible    ${SSP_FIELD}    timeout=10s
    Input Text    ${SSP_FIELD}    ${SSP_Value}
    Log To Console    Filled lastname field with ${SSP_Value}

    Log To Console    Waiting 3 seconds before process...
    Sleep    1.5s
    Wait Until Element Is Visible    ${CA_FIELD}    timeout=10s
    Input Text    ${CA_FIELD}    ${CA_Value}
    Log To Console    Filled lastname field with ${CA_Value}


Select ID Type
    # รอจนกว่าฟิลด์ input จะพร้อมใช้งาน
    Log To Console    Waiting 2 seconds for Process...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click With Fallback    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']

    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='Passport']    timeout=10s
    Click With Fallback    xpath=//li[normalize-space(.)='Passport']
    Log To Console    Selected Type Passport.
    Sleep    1.5s

ID Number
    Log To Console    Waiting 3 seconds before filling Number...
    Sleep    1.5s
    Wait Until Element Is Visible    ${ID_FIELD}    timeout=10s
    Input Text    ${ID_FIELD}    ${ID_Value}
    Log To Console    Filled lastname field with ${ID_Value}


BirthDay Date
    Log To Console    Waiting 1.5s For Process..
    Sleep    1.5s
    # Scroll ไปที่ฟิลด์ Birth date
    Scroll Element Into View    ${BD_FIELD}
    Wait Until Element Is Visible    ${BD_FIELD}    timeout=10s
    Input Text    ${BD_FIELD}    ${BD_Value}
    Log To Console    Filled Date field with ${BD_Value}

Marriage Status
    # รอจนกว่าฟิลด์ input จะพร้อมใช้งาน
    Log To Console    Waiting 2 seconds for Process...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click With Fallback    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']

    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='Single']    timeout=10s
    Click With Fallback    xpath=//li[normalize-space(.)='Single']
    Log To Console    Selected Type Passport.
    Sleep    1.5s
    
Staff Group
    # รอจนกว่าฟิลด์ input จะพร้อมใช้งาน
    Log To Console    Waiting 2 seconds for Process...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click With Fallback    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']

    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='OPPO']    timeout=10s
    Click With Fallback    xpath=//li[normalize-space(.)='OPPO']
    Log To Console    Selected Type Passport.
    Sleep    1.5s

Onboard type
    # รอจนกว่าฟิลด์ input จะพร้อมใช้งาน
    Log To Console    Waiting 2 seconds for Process...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click With Fallback    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']

    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='On Probation']    timeout=10s
    Click With Fallback    xpath=//li[normalize-space(.)='On Probation']
    Log To Console    Selected Type Passport.
    Sleep    1.5s


Join Date
    Log To Console    Waiting 1.5s For Process..
    Sleep    1.5s
    # Scroll ไปที่ฟิลด์ Birth date
    Scroll Element Into View    ${JO_FIELD}
    Wait Until Element Is Visible    ${JO_FIELD}    timeout=10s
    Input Text    ${JO_FIELD}    ${JO_Value}
    Log To Console    Filled Date field with ${JO_Value}

Probation days
    Log To Console    Waiting 3 seconds before filling Probation days...
    Sleep    1.5s
    Wait Until Element Is Visible    ${PROBA_FIELD}    timeout=10s
    Input Text    ${PROBA_FIELD}    ${PROBA_Value}
    Log To Console    Filled lastname field with ${PROBA_Value}
    Sleep    2s

Regulation Date
    Log To Console    Waiting 1.5s For Process..
    Sleep    1.5s
    # Scroll ไปที่ฟิลด์ Birth date
    Scroll Element Into View    ${RD_FIELD}
    Wait Until Element Is Visible    ${RD_FIELD}    timeout=10s
    Input Text    ${RD_FIELD}    ${RD_Value}
    Log To Console    Filled Date field with ${RD_Value}

Click Next Button Info Page
    # รอจนกว่าองค์ประกอบจะปรากฏ
    Scroll Element Into View    ${NEXT_BUTTON}
    Wait Until Element Is Visible    ${NEXT_BUTTON}    timeout=10s
    Click Element    ${NEXT_BUTTON}
    Log To Console    Clicked the Next button
    Sleep    4s
        
SKIP Education Page
    Scroll Element Into View    ${Next_EDU}
    Wait Until Element Is Visible    ${Next_EDU}    timeout=10s
    Click Element    ${Next_EDU}
    Log To Console    Clicked the Next button
    Sleep    4s

SKIP Work Exps
    Scroll Element Into View    ${Next_EXP}
    Wait Until Element Is Visible    ${Next_EXP}    timeout=10s
    Click Element    ${Next_EXP}
    Log To Console    Clicked the Next button
    Sleep    4s

PayMent Salary
    Log To Console    Waiting 3 seconds before Process...
    Sleep    1.5s
    Wait Until Element Is Visible    ${SLY_FIELD}    timeout=10s
    Input Text    ${SLY_FIELD}    ${SLY_Value}
    Log To Console    Filled lastname field with ${SLY_Value}
    Sleep    1.5s

KPI Fill
    Log To Console    Waiting 3 seconds before Process...
    Sleep    1.5s
    Wait Until Element Is Visible    ${KPI_FIELD}    timeout=10s
    Input Text    ${KPI_FIELD}    ${KPI_Value} 
    Log To Console    Filled lastname field with ${KPI_Value} 
    Sleep    1.5s

Allow Fill
    Log To Console    Waiting 3 seconds before Process...
    Sleep    1.5s
    Wait Until Element Is Visible    ${Allow_FIELD}    timeout=10s
    Input Text    ${Allow_FIELD}    ${Allow_Value} 
    Log To Console    Filled lastname field with ${Allow_Value} 
    Sleep    1.5s

Tax No
    Log To Console    Waiting 3 seconds before Process...
    Sleep    1.5s
    Wait Until Element Is Visible    ${Taxno_FIELD}     timeout=10s
    Input Text    ${Taxno_FIELD}     ${Taxno_Value} 
    Log To Console    Filled lastname field with ${Taxno_Value} 
    Sleep    1.5s

Curp Fill
    Log To Console    Waiting 3 seconds before Process...
    Sleep    1.5s
    Wait Until Element Is Visible    ${Curp_FIELD}    timeout=10s
    Input Text    ${Curp_FIELD}    ${Curp_Value} 
    Log To Console    Filled lastname field with ${Curp_Value} 
    Sleep    1.5s

TaxAdd Fill
    Log To Console    Waiting 3 seconds before Process...
    Sleep    1.5s
    Wait Until Element Is Visible    ${TaxAdd_FIELD}    timeout=10s
    Input Text    ${TaxAdd_FIELD}    ${TaxAdd_Value} 
    Log To Console    Filled lastname field with ${TaxAdd_Value} 
    Sleep    1.5s

InSuno Fill
    Log To Console    Waiting 3 seconds before Process...
    Sleep    1.5s
    Wait Until Element Is Visible    ${Insuno_FIELD}    timeout=10s
    Input Text    ${Insuno_FIELD}    ${Insuno_Value} 
    Log To Console    Filled lastname field with ${Insuno_Value} 
    Sleep    1.5s

IDcard Fill
    Log To Console    Waiting 3 seconds before Process...
    Sleep    1.5s
    Wait Until Element Is Visible    ${IDcard_FIELD}    timeout=10s
    Input Text    ${IDcard_FIELD}    ${IDcard_Value} 
    Log To Console    Filled lastname field with ${IDcard_Value} 
    Sleep    1.5s

BankAccount Fill 
    Log To Console    Waiting 3 seconds before Process...
    Sleep    1.5s
    Wait Until Element Is Visible    ${BankAcc_FIELD}    timeout=10s
    Input Text    ${BankAcc_FIELD}    ${BankAcc_FValue} 
    Log To Console    Filled lastname field with ${BankAcc_FValue} 
    Sleep    1.5s

BankNO Fill 
    Log To Console    Waiting 3 seconds before Process...
    Sleep    1.5s
    Wait Until Element Is Visible    ${BankNo_FIELD}    timeout=10s
    Input Text    ${BankNo_FIELD}    ${BankNo_Value} 
    Log To Console    Filled lastname field with ${BankNo_Value} 
    Sleep    1.5s
        
Fill BankName
    Log To Console    Waiting 2 seconds for Process...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click With Fallback    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='- Banco Azteca -']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='- Banco Azteca -']
    Log To Console    Selected Gender Algeria.
    Sleep    1.5s

PayRoll Type
    Log To Console    Waiting 2 seconds for Process...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click With Fallback    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='- Every 15 days -']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='- Every 15 days -']
    Log To Console    Selected Gender Algeria.
    Sleep    1.5s

Payment Type Fill
    Log To Console    Waiting 2 seconds for Process...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click With Fallback    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='- Bank Transfer -']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='- Bank Transfer -']
    Log To Console    Selected Gender Algeria.
    Sleep    1.5s

Click Next Button Payment Page
    Scroll Element Into View    ${Next_Salary}
    Wait Until Element Is Visible    ${Next_Salary}    timeout=10s
    Click Element    ${Next_Salary}
    Log To Console    Clicked the Next button
    Sleep    4s

Father Field
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${Father_Field}
    Wait Until Element Is Visible    ${Father_Field}    timeout=10s
    Input Text    ${Father_Field}    ${Father_Value}
    Log To Console    Filled lastname field with ${Father_Value}
    Sleep    1.5

Mother Fill 
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${Mother_Field}
    Wait Until Element Is Visible    ${Mother_Field}    timeout=10s
    Input Text    ${Mother_Field}    ${Mother_Value} 
    Log To Console    Filled lastname field with ${Mother_Value} 
    Sleep    1.5

Work Fill 
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${WorkTool_Field} 
    Wait Until Element Is Visible    ${WorkTool_Field}     timeout=10s
    Input Text    ${WorkTool_Field}     ${WorkTool_Value}  
    Log To Console    Filled lastname field with ${WorkTool_Value} 
    Sleep    1.5

Activity Develop
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${Activity_Field} 
    Wait Until Element Is Visible    ${Activity_Field}     timeout=10s
    Input Text    ${Activity_Field}     ${Activity_Value}  
    Log To Console    Filled lastname field with ${Activity_Value} 
    Sleep    1.5

Working Schedule
    Log To Console    Waiting 2 seconds for Process...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click With Fallback    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='- FROM MONDAY TO SUNDAY WITH ONE DAY OFF -']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='- FROM MONDAY TO SUNDAY WITH ONE DAY OFF -']
    Log To Console    Selected - FROM MONDAY TO SUNDAY WITH ONE DAY OFF - .
    Sleep    1.5s

Working Schedule Field
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${WorkingS_Field}  
    Wait Until Element Is Visible    ${WorkingS_Field}      timeout=10s
    Input Text    ${WorkingS_Field}      ${WorkingS_Value}  
    Log To Console    Filled lastname field with ${WorkingS_Value} 
    Sleep    1.5


Times Field
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${Time_Field} 
    Wait Until Element Is Visible    ${Time_Field}      timeout=10s
    Input Text    ${Time_Field}      ${Time_Value}   
    Log To Console    Filled lastname field with ${Time_Value} 
    Sleep    1.5

Lunch Time
    Log To Console    Waiting 2 seconds for Process...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click With Fallback    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='- 8 Hour -']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='- 8 Hour -']
    Log To Console    Selected 8 Hours.
    Sleep    1.5s

Street of work Location
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${WorkLocate_Field} 
    Wait Until Element Is Visible    ${WorkLocate_Field}      timeout=10s
    Input Text    ${WorkLocate_Field}      ${WorkLocate_Value}   
    Log To Console    Filled lastname field with ${WorkLocate_Value} 
    Sleep    1.5

External Number
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${ExNowork_Field}
    Wait Until Element Is Visible    ${ExNowork_Field}      timeout=10s
    Input Text    ${ExNowork_Field}      ${ExNowork_Value}   
    Log To Console    Filled lastname field with ${ExNowork_Value} 
    Sleep    1.5

Internal Number
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${InNowork_Field}
    Wait Until Element Is Visible    ${InNowork_Field}      timeout=10s
    Input Text    ${InNowork_Field}      ${InNowork_Value}   
    Log To Console    Filled lastname field with ${InNowork_Value} 
    Sleep    1.5

Neighborhood Work located
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${NBhood_Field}
    Wait Until Element Is Visible    ${NBhood_Field}      timeout=10s
    Input Text    ${NBhood_Field}      ${NBhood_Value}   
    Log To Console    Filled lastname field with ${NBhood_Value} 
    Sleep    1.5

ZipCode Work located
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${ZipCode_Field}
    Wait Until Element Is Visible    ${ZipCode_Field}      timeout=10s
    Input Text    ${ZipCode_Field}      ${ZipCode_Value}   
    Log To Console    Filled lastname field with ${ZipCode_Value} 
    Sleep    1.5

Muni Work located   
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${Muni_Field}
    Wait Until Element Is Visible    ${Muni_Field}      timeout=10s
    Input Text    ${Muni_Field}      ${Muni_Value}   
    Log To Console    Filled lastname field with ${Muni_Value} 
    Sleep    1.5  

SWL Test
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${SWL_Field}
    Wait Until Element Is Visible    ${SWL_Field}      timeout=10s
    Input Text    ${SWL_Field}      ${SWL_Value}   
    Log To Console    Filled lastname field with ${SWL_Value} 
    Sleep    1.5

EmployAdd Field
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${EmployAdd_Field}
    Wait Until Element Is Visible    ${EmployAdd_Field}      timeout=10s
    Input Text    ${EmployAdd_Field}      ${EmployAdd_Value}   
    Log To Console    Filled lastname field with ${EmployAdd_Value} 
    Sleep    1.5

ExEmployAdd Field
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${ExEmployAdd_Field}
    Wait Until Element Is Visible    ${ExEmployAdd_Field}      timeout=10s
    Input Text    ${ExEmployAdd_Field}      ${ExEmployAdd_Value}   
    Log To Console    Filled lastname field with ${ExEmployAdd_Value} 
    Sleep    1.5

InEmployAdd Field
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${InEmployAdd_Field}
    Wait Until Element Is Visible    ${InEmployAdd_Field}      timeout=10s
    Input Text    ${InEmployAdd_Field}      ${InEmployAdd_Value}   
    Log To Console    Filled lastname field with ${InEmployAdd_Value} 
    Sleep    1.5

NBhood Em Add 
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${NBhoodEmAdd_Field}
    Wait Until Element Is Visible    ${NBhoodEmAdd_Field}      timeout=10s
    Input Text    ${NBhoodEmAdd_Field}      ${NBhoodEmAdd_Value}   
    Log To Console    Filled lastname field with ${NBhoodEmAdd_Value} 
    Sleep    1.5

Zipcode Em Add
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${ZipCodeEmAdd_Field}
    Wait Until Element Is Visible    ${ZipCodeEmAdd_Field}      timeout=10s
    Input Text    ${ZipCodeEmAdd_Field}      ${ZipCodeEmAdd_Value}   
    Log To Console    Filled lastname field with ${ZipCodeEmAdd_Value} 
    Sleep    1.5

Muni Em Add
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${MuniEmAdd_Field}
    Wait Until Element Is Visible    ${MuniEmAdd_Field}      timeout=10s
    Input Text    ${MuniEmAdd_Field}      ${MuniEmAdd_Value}   
    Log To Console    Filled lastname field with ${MuniEmAdd_Value} 
    Sleep    1.5

Muni Em Add
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${NoInfo_Field}
    Wait Until Element Is Visible    ${NoInfo_Field}      timeout=10s
    Input Text    ${NoInfo_Field}      ${NoInfo_Value}    
    Log To Console    Filled lastname field with ${NoInfo_Value}  
    Sleep    1.5

Emergen Cont
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${EmerCont_Field}
    Wait Until Element Is Visible    ${EmerCont_Field}      timeout=10s
    Input Text    ${EmerCont_Field}      ${EmerCont_Value}    
    Log To Console    Filled lastname field with ${EmerCont_Value}  
    Sleep    1.5

Emergen Cont Phone
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s
    Scroll Element Into View    ${EmerContPhone_Field}
    Wait Until Element Is Visible    ${EmerContPhone_Field}      timeout=10s
    Input Text    ${EmerContPhone_Field}      ${EmerContPhone_Value}    
    Log To Console    Filled lastname field with ${EmerContPhone_Value}  
    Sleep    1.5

Emer Contact Relationships
    Log To Console    Waiting 2 seconds for Process...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click With Fallback    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='- Father -']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='- Father -']
    Log To Console    Selected 8 Hours.
    Sleep    1.5s

Click Next Button Payment Page
    Scroll Element Into View    ${Next_Other}
    Wait Until Element Is Visible    ${Next_Other}    timeout=10s
    Click Element    ${Next_Other}
    Log To Console    Clicked the Next button
    Sleep    4s

Fill File 1
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s

    ${FILE_PATH}=    Set Variable    /Users/kraisit.rob/Downloads/pod-juice-oxbar-35k.jpg
    File Should Exist    ${FILE_PATH}
    
    # ใช้ JavaScript เพื่อตั้งค่า value โดยตรง
    Execute JavaScript    document.getElementById('file1').style.display = 'block';
    Execute JavaScript    document.getElementById('file1').style.visibility = 'visible';
    Execute JavaScript    document.getElementById('file1').style.opacity = '1';
    
    Wait Until Element Is Visible    ${File1}    10s
    Choose File    ${File1}    ${FILE_PATH}
    
    Log To Console    Successfully uploaded file via JavaScript method
    Sleep    2s

Fill File 2
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s

    ${FILE_PATH}=    Set Variable    /Users/kraisit.rob/Downloads/pod-juice-oxbar-35k.jpg
    File Should Exist    ${FILE_PATH}
    
    # ใช้ JavaScript เพื่อตั้งค่า value โดยตรง
    Execute JavaScript    document.getElementById('file2').style.display = 'block';
    Execute JavaScript    document.getElementById('file2').style.visibility = 'visible';
    Execute JavaScript    document.getElementById('file2').style.opacity = '1';
    
    Wait Until Element Is Visible    ${File2}    10s
    Choose File    ${File2}    ${FILE_PATH}
    
    Log To Console    Successfully uploaded file via JavaScript method
    Sleep    2s

Fill File 3
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s

    ${FILE_PATH}=    Set Variable    /Users/kraisit.rob/Downloads/pod-juice-oxbar-35k.jpg
    File Should Exist    ${FILE_PATH}
    
    # ใช้ JavaScript เพื่อตั้งค่า value โดยตรง
    Execute JavaScript    document.getElementById('file3').style.display = 'block';
    Execute JavaScript    document.getElementById('file3').style.visibility = 'visible';
    Execute JavaScript    document.getElementById('file3').style.opacity = '1';
    
    Wait Until Element Is Visible    ${File3}    10s
    Choose File    ${File3}    ${FILE_PATH}
    
    Log To Console    Successfully uploaded file via JavaScript method
    Sleep    2s

Fill File 4
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s

    ${FILE_PATH}=    Set Variable    /Users/kraisit.rob/Downloads/pod-juice-oxbar-35k.jpg
    File Should Exist    ${FILE_PATH}
    
    # ใช้ JavaScript เพื่อตั้งค่า value โดยตรง
    Execute JavaScript    document.getElementById('file4').style.display = 'block';
    Execute JavaScript    document.getElementById('file4').style.visibility = 'visible';
    Execute JavaScript    document.getElementById('file4').style.opacity = '1';
    
    Wait Until Element Is Visible    ${File4}    10s
    Choose File    ${File4}    ${FILE_PATH}
    
    Log To Console    Successfully uploaded file via JavaScript method
    Sleep    2s

Fill File 5
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s

    ${FILE_PATH}=    Set Variable    /Users/kraisit.rob/Downloads/pod-juice-oxbar-35k.jpg
    File Should Exist    ${FILE_PATH}
    
    # ใช้ JavaScript เพื่อตั้งค่า value โดยตรง
    Execute JavaScript    document.getElementById('file5').style.display = 'block';
    Execute JavaScript    document.getElementById('file5').style.visibility = 'visible';
    Execute JavaScript    document.getElementById('file5').style.opacity = '1';
    
    Wait Until Element Is Visible    ${File5}    10s
    Choose File    ${File5}    ${FILE_PATH}
    
    Log To Console    Successfully uploaded file via JavaScript method
    Sleep    2s

Fill File 6
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s

    ${FILE_PATH}=    Set Variable    /Users/kraisit.rob/Downloads/pod-juice-oxbar-35k.jpg
    File Should Exist    ${FILE_PATH}
    
    # ใช้ JavaScript เพื่อตั้งค่า value โดยตรง
    Execute JavaScript    document.getElementById('file6').style.display = 'block';
    Execute JavaScript    document.getElementById('file6').style.visibility = 'visible';
    Execute JavaScript    document.getElementById('file6').style.opacity = '1';
    
    Wait Until Element Is Visible    ${File6}    10s
    Choose File    ${File6}    ${FILE_PATH}
    
    Log To Console    Successfully uploaded file via JavaScript method
    Sleep    2s

Fill File 7
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s

    ${FILE_PATH}=    Set Variable    /Users/kraisit.rob/Downloads/pod-juice-oxbar-35k.jpg
    File Should Exist    ${FILE_PATH}
    
    # ใช้ JavaScript เพื่อตั้งค่า value โดยตรง
    Execute JavaScript    document.getElementById('file7').style.display = 'block';
    Execute JavaScript    document.getElementById('file7').style.visibility = 'visible';
    Execute JavaScript    document.getElementById('file7').style.opacity = '1';
    
    Wait Until Element Is Visible    ${File7}    10s
    Choose File    ${File7}    ${FILE_PATH}
    
    Log To Console    Successfully uploaded file via JavaScript method
    Sleep    2s

Fill File 8
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s

    ${FILE_PATH}=    Set Variable    /Users/kraisit.rob/Downloads/pod-juice-oxbar-35k.jpg
    File Should Exist    ${FILE_PATH}
    
    # ใช้ JavaScript เพื่อตั้งค่า value โดยตรง
    Execute JavaScript    document.getElementById('file8').style.display = 'block';
    Execute JavaScript    document.getElementById('file8').style.visibility = 'visible';
    Execute JavaScript    document.getElementById('file8').style.opacity = '1';
    
    Wait Until Element Is Visible    ${File8}    10s
    Choose File    ${File8}    ${FILE_PATH}
    
    Log To Console    Successfully uploaded file via JavaScript method
    Sleep    2s

Fill File 9
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s

    ${FILE_PATH}=    Set Variable    /Users/kraisit.rob/Downloads/pod-juice-oxbar-35k.jpg
    File Should Exist    ${FILE_PATH}
    
    # ใช้ JavaScript เพื่อตั้งค่า value โดยตรง
    Execute JavaScript    document.getElementById('file9').style.display = 'block';
    Execute JavaScript    document.getElementById('file9').style.visibility = 'visible';
    Execute JavaScript    document.getElementById('file9').style.opacity = '1';
    
    Wait Until Element Is Visible    ${File9}    10s
    Choose File    ${File9}    ${FILE_PATH}
    
    Log To Console    Successfully uploaded file via JavaScript method
    Sleep    2s

Fill File 10
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s

    ${FILE_PATH}=    Set Variable    /Users/kraisit.rob/Downloads/pod-juice-oxbar-35k.jpg
    File Should Exist    ${FILE_PATH}
    
    # ใช้ JavaScript เพื่อตั้งค่า value โดยตรง
    Execute JavaScript    document.getElementById('file10').style.display = 'block';
    Execute JavaScript    document.getElementById('file10').style.visibility = 'visible';
    Execute JavaScript    document.getElementById('file10').style.opacity = '1';
    
    Wait Until Element Is Visible    ${File10}    10s
    Choose File    ${File10}    ${FILE_PATH}
    
    Log To Console    Successfully uploaded file via JavaScript method
    Sleep    2s

Fill File 11
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s

    ${FILE_PATH}=    Set Variable    /Users/kraisit.rob/Downloads/pod-juice-oxbar-35k.jpg
    File Should Exist    ${FILE_PATH}
    
    # ใช้ JavaScript เพื่อตั้งค่า value โดยตรง
    Execute JavaScript    document.getElementById('file11').style.display = 'block';
    Execute JavaScript    document.getElementById('file11').style.visibility = 'visible';
    Execute JavaScript    document.getElementById('file11').style.opacity = '1';
    
    Wait Until Element Is Visible    ${File11}    10s
    Choose File    ${File11}    ${FILE_PATH}
    
    Log To Console    Successfully uploaded file via JavaScript method
    Sleep    2s

Fill File 12
    Log To Console    Waiting 1.5 seconds before Process...
    Sleep    1.5s

    ${FILE_PATH}=    Set Variable    /Users/kraisit.rob/Downloads/pod-juice-oxbar-35k.jpg
    File Should Exist    ${FILE_PATH}
    
    # ใช้ JavaScript เพื่อตั้งค่า value โดยตรง
    Execute JavaScript    document.getElementById('file12').style.display = 'block';
    Execute JavaScript    document.getElementById('file12').style.visibility = 'visible';
    Execute JavaScript    document.getElementById('file12').style.opacity = '1';
    
    Wait Until Element Is Visible    ${File12}    10s
    Choose File    ${File12}    ${FILE_PATH}
    
    Log To Console    Successfully uploaded file via JavaScript method
    Sleep    2s

Click Next Button Payment Page
    Scroll Element Into View    ${Next_Other}
    Wait Until Element Is Visible    ${Next_Other}    timeout=10s
    Click Element    ${Next_Other}
    Log To Console    Clicked the Next button
    Sleep    4s

Fill Agent
# เลือก Agent
    Log To Console    Waiting 3 seconds before filling Agent...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click Element    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='- Celex -']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='- Celex -']
    Log To Console    Selected State Celex.

Agent Joint Date
    Log To Console    Waiting 1.5s For Process..
    Sleep    1.5s
    # Scroll ไปที่ฟิลด์ Birth date
    Scroll Element Into View    ${AgentJoin}
    Wait Until Element Is Visible    ${AgentJoin}    timeout=10s
    Input Text    ${AgentJoin}    ${AgentJoinValue}
    Log To Console    Filled Date field with ${AgentJoinValue}

Data Send Agent 
    Log To Console    Waiting 1.5s For Process..
    Sleep    1.5s
    # Scroll ไปที่ฟิลด์ Birth date
    Scroll Element Into View    ${AgentJoin}
    Wait Until Element Is Visible    ${AgentJoin}    timeout=10s
    Input Text    ${AgentJoin}    ${AgentJoinValue}
    Log To Console    Filled Date field with ${AgentJoinValue}

Fill Contact Type
    Log To Console    Waiting 3 seconds before filling data...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click Element    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='- Temporary -']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='- Temporary -']
    Log To Console    Selected State  Temporary.

Fill Contact Period
    Log To Console    Waiting 3 seconds before filling data...
    Sleep    1.5s
    Wait Until Element Is Visible    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']    timeout=10s
    Scroll Element Into View    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Click Element    xpath=//div[@class='select-wrapper'] //input[@class='select-dropdown dropdown-trigger']
    Sleep    1.5s  # เพิ่มการรอหลังจากคลิก
    Wait Until Element Is Visible    xpath=//li[normalize-space(.)='- 1 Month -']    timeout=10s
    Click Element    xpath=//li[normalize-space(.)='- 1 Month -']
    Log To Console    Selected State  Temporary.

Expire Date
    Log To Console    Waiting 1.5s For Process..
    Sleep    1.5s
    # Scroll ไปที่ฟิลด์ Birth date
    Scroll Element Into View    ${ExpireDate}
    Wait Until Element Is Visible    ${ExpireDate}    timeout=10s
    Input Text    ${ExpireDate}    ${ExpireValue} 
    Log To Console    Filled Date field with ${ExpireValue} 

Remark
    Log To Console    Waiting 1.5s For Process..
    Sleep    1.5s
    # Scroll ไปที่ฟิลด์ Remark
    Scroll Element Into View    ${RemarkFill} 
    Wait Until Element Is Visible    ${RemarkFill}     timeout=10s
    Input Text    ${RemarkFill}     ${RemarkValue}
    Log To Console    Filled Date field with ${RemarkValue}

Click Next Save Button
    Scroll Element Into View    ${Save}
    Wait Until Element Is Visible    ${Save}    timeout=10s
    Click Element    ${Save}
    Log To Console    Clicked the Next button
    Sleep    4s

    Sleep    4s
    Close Browser
