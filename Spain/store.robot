*** Settings ***
Library    SeleniumLibrary
Library    ImapLibrary2
Library    String
Library    OperatingSystem
Library    DateTime

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

# UPDATED LOCATORS FOR BETTER ROBUSTNESS
${SALE_CENTER_LINK}     xpath=//a[normalize-space()='Sale center']
${DISTRIBUTOR_LINK}     xpath=//a[normalize-space()='Distributor']
${ADD_NEW_BUTTON}       xpath=//button[contains(., 'Add New')]
${PRODUCT_CENTER_LINK}    xpath=//button[contains(., 'Product Center')]
${PRODUCT}    xpath=//button[contains(., 'Product')]

# Locators for Create Distributor Form
${CUSTOMER_NAME_FIELD}          id:title
${STORE_COMPANY_NAME_FIELD}     id:name
${CUSTOMER_CODE_FIELD}          id:store_code
${UserType}                     id:user_type
${Distributor_TYPE_DROPDOWN}          id:store_type

# Locators for Invoice Info
${TAX_COUNTRY_DROPDOWN}         id:country_addressTax
${TAX_PROVINCE_DROPDOWN}        id:province_addressTax
${TAX_CITY_DROPDOWN}            id:district_addressTax
${TAX_DISTRICT_DROPDOWN}        id:street_addressTax
${TAX_POSTAL_CODE_DROPDOWN}     id:postalcode_addressTax
${TAX_ADDRESS_DETAILS}          add_addressTax

# NEW LOCATORS ADDED
# กลับไปใช้ id:name_recipient เพราะจากภาพที่ให้มา id นี้ดูถูกต้องที่สุด
${RECIPIENT_NAME_FIELD}         id:recipient_name
${Tel}                          id: tel 
${PHONE_CODE_DROPDOWN}          id:country_code_phone
${DELIVERY_COUNTRY_DROPDOWN}    id:country_delivery1
${DELIVERY_PROVINCE_DROPDOWN}   id:province_delivery1
${city}   id:district_delivery1
${street}                       id:street_delivery1
${DELIVERY_POSTAL_CODE_DROPDOWN}    id:postalcode_delivery1
${SHIPPING_FEE_CHECKBOX}        id:shipping_fee_status_delivery1
${SHIPPING_FEE_INPUT}           id:shipping_fee_delivery1
${DELIVERY_ADDRESS_DETAILS}     id:add_delivery1
${nif}                          id : nif
${whatp}                        id : contact_country_code
${whats_app}                    id : whats_app
${email}                        id : email
${warehouse}                    id : warehouse_id
${nots}                         id : nots



# Submit Button
${SUBMIT_BUTTON}                xpath=//button[@type='submit' and text()='Submit']
${OK_BUTTON_POPUP}              xpath=//button[text()='OK']


*** Test Cases ***
Create New Distributor Full Form
    [Tags]    Distributor
    Open And Navigate To Login Page
    Input Username    ${USERNAME}
    Enter Password    ${PASSWORD}
    Click Sign In Button
    Verify Login Was Successful
    Navigate To Create Distributor
    Fill Distributor Details
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

    Log To Console    Waiting for 5 seconds...
    Sleep    5s

    Log To Console    Capturing page screenshot...
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    Capture Page Screenshot    filename=${SCREENSHOT_DIR}/login_success_${timestamp}.png

Navigate To Create Distributor
    Log To Console    Navigating to Sale center -> Distributor... (กำลังไปยัง Sale center -> Distributor...)
    Wait Until Element Is Visible    ${SALE_CENTER_LINK}    timeout=10s
    Click Element    ${SALE_CENTER_LINK}
    Log To Console    Clicked Sale center. Waiting for Distributor link to appear. (คลิก Sale center แล้ว กำลังรอลิงก์ Distributor ปรากฏ)
    
    Wait Until Element Is Visible    ${DISTRIBUTOR_LINK}    timeout=10s
    Click Element    ${DISTRIBUTOR_LINK}
    Log To Console    Clicked Distributor. (คลิก Distributor แล้ว)
    
    Wait Until Page Contains Element    ${ADD_NEW_BUTTON}    timeout=10s
    Log To Console    Waiting for 3 seconds before clicking Add New... (กำลังรอ 3 วินาทีก่อนคลิก Add New...)
    Sleep    3s
    Log To Console    Clicking Add New button... (กำลังคลิกปุ่ม Add New...)
    Click Button    ${ADD_NEW_BUTTON}
    Wait Until Page Contains    Create Distributor    timeout=10s 
    Log To Console    Successfully navigated to create distributor form. (นำทางไปยังหน้าสร้างฟอร์ม Distributor สำเร็จแล้ว)
    Sleep    7s    # **เพิ่มเวลารอเป็น 7 วินาที** เพื่อให้ฟอร์มโหลดได้สมบูรณ์ยิ่งขึ้น

Fill Distributor Details
    Log To Console    Starting to fill Distributor form details... (กำลังเริ่มกรอกรายละเอียดฟอร์ม Distributor...)

    # Basic Info
    Wait Until Element Is Visible    ${CUSTOMER_NAME_FIELD}    timeout=10s
    Input Text    ${CUSTOMER_NAME_FIELD}          Store Teddy Test
    Log To Console    Filled Customer Name. (กรอกชื่อลูกค้าแล้ว)

    Wait Until Element Is Visible    ${STORE_COMPANY_NAME_FIELD}    timeout=5s
    Input Text    ${STORE_COMPANY_NAME_FIELD}     Company Store Test
    Log To Console    Filled Store/Company Name. (กรอกชื่อร้าน/บริษัทแล้ว)

    Wait Until Element Is Visible    ${UserType}    timeout=5s
    Select From List By Value    ${UserType}    2    # เลือก "Store" ตาม value="2"
    Log To Console    Selected "Store" for Distributor Type. (เลือก "Store" สำหรับประเภท Store แล้ว)

    Wait Until Element Is Visible    ${Distributor_TYPE_DROPDOWN}    timeout=5s
    Select From List By Value    ${Distributor_TYPE_DROPDOWN}    2    # เลือก "Store" ตาม value="2"
    Log To Console    Selected "Store" for Distributor Type. (เลือก "Store" สำหรับประเภท Store แล้ว)

    # NEW STEPS: Fill Invoice Info
    Log To Console    Starting to fill Invoice Info... (กำลังเริ่มกรอกข้อมูลใบแจ้งหนี้...)

    Wait Until Element Is Visible    ${TAX_COUNTRY_DROPDOWN}    timeout=5s
    Select From List By Label    ${TAX_COUNTRY_DROPDOWN}    Spain
    Log To Console    Selected Spain for Tax Country. (เลือกสเปนสำหรับประเทศภาษีแล้ว)
    Sleep    2s    # รอให้ Province/State โหลด

    Wait Until Element Is Visible    ${TAX_PROVINCE_DROPDOWN}    timeout=5s
    Select From List By Label    ${TAX_PROVINCE_DROPDOWN}    Aragon
    Log To Console    Selected Aragon for Tax Province/State. (เลือก Aragon สำหรับจังหวัด/รัฐภาษีแล้ว)
    Sleep    2s    # รอให้ City โหลด

    Wait Until Element Is Visible    ${TAX_CITY_DROPDOWN}    timeout=5s
    Select From List By Label    ${TAX_CITY_DROPDOWN}    Provincia de Teruel
    Log To Console    Selected Provincia de Teruel for Tax City. (เลือก Provincia de Teruel สำหรับเมืองภาษีแล้ว)
    Sleep    2s    # รอให้ District/Street โหลด

    Wait Until Element Is Visible    ${TAX_DISTRICT_DROPDOWN}    timeout=5s
    Select From List By Label    ${TAX_DISTRICT_DROPDOWN}    Abejuela
    Log To Console    Selected Abejuela for Tax District/Street. (เลือก Abejuela สำหรับเขต/ถนนภาษีแล้ว)
    Sleep    2s    # รอให้ Postal Code โหลด

    Wait Until Element Is Visible    ${TAX_POSTAL_CODE_DROPDOWN}    timeout=5s
    Select From List By Label    ${TAX_POSTAL_CODE_DROPDOWN}    44422 - Abejuela
    Log To Console    Selected 44422 - Abejuela for Tax Postal Code. (เลือก 44422 - Abejuela สำหรับรหัสไปรษณีย์ภาษีแล้ว)

    Wait Until Element Is Visible    ${TAX_ADDRESS_DETAILS}    timeout=5s
    Input Text    ${TAX_ADDRESS_DETAILS}          Test Tax Address
    Log To Console    Filled Tax Address Details. (กรอกรายละเอียดที่อยู่ภาษีแล้ว)

    Wait Until Element Is Visible    ${nif}    timeout=5s
    Input Text    ${nif}     test
    Log To Console    Filled nif Details with 'test'. (กรอกรายละเอียดที่อยู่เป็น 'test' แล้ว)

    Wait Until Element Is Visible    ${whatp}  timeout=5s
    Select From List By Label    ${whatp}    +66 TH    # เลือก +66 (Thailand) 
    Log To Console    Selected +66 for Phone Code. (เลือก +66 สำหรับรหัสโทรศัพท์แล้ว)

    Wait Until Element Is Visible    ${whats_app}    timeout=5s
    Input Text    ${whats_app}         0654389470
    Log To Console    Selected 0654389470 for whats_app number. (เลือก 0654389470 สำหรับเบอร์โทรศัพท์แล้ว)

    Wait Until Element Is Visible    ${email}    timeout=5s
    Input Text    ${email}          teddydybearbear@gmail.com
    Log To Console    Selected teddydybearbear@gmail.com for email. (เลือก teddydybearbear@gmail.com สำหรับอีเมล)



    Log To Console    Finished filling Invoice Info. (กรอกข้อมูลใบแจ้งหนี้เสร็จสิ้นแล้ว)
    Sleep    3s 


    # Receiver Info
    # กลับไปใช้ id:name_recipient และเปลี่ยนเป็น Wait Until Element Is Enabled
    Scroll Element Into View    ${RECIPIENT_NAME_FIELD}
    Wait Until Element Is Enabled    ${RECIPIENT_NAME_FIELD}    timeout=5s
    Input Text    ${RECIPIENT_NAME_FIELD}         Recipient Test Name
    Log To Console    Filled Name of the recipient. (กรอกชื่อผู้รับแล้ว)

    Wait Until Element Is Visible    ${PHONE_CODE_DROPDOWN}    timeout=5s
    Select From List By Label    ${PHONE_CODE_DROPDOWN}    +66 TH    # เลือก +66 (Thailand) 
    Log To Console    Selected +66 for Phone Code. (เลือก +66 สำหรับรหัสโทรศัพท์แล้ว)

    Wait Until Element Is Visible    ${Tel}    timeout=5s
    Input Text    ${Tel}         0631310226
    Log To Console    Selected 0631310226 for Phone number. (เลือก 0631310226 สำหรับเบอร์โทรศัพท์แล้ว)


    Wait Until Element Is Visible    ${DELIVERY_COUNTRY_DROPDOWN}    timeout=5s
    Select From List By Label    ${DELIVERY_COUNTRY_DROPDOWN}    Spain
    Log To Console    Selected Spain for Delivery Country. (เลือกสเปนสำหรับประเทศจัดส่งแล้ว)
    Sleep    2s    # รอให้ Province/State โหลด

    Wait Until Element Is Visible    ${DELIVERY_PROVINCE_DROPDOWN}    timeout=5s
    Select From List By Label    ${DELIVERY_PROVINCE_DROPDOWN}    Aragon
    Log To Console    Selected Aragon for Delivery Province/State. (เลือก Aragon สำหรับจังหวัด/รัฐจัดส่งแล้ว)
    Sleep    2s    # รอให้ District/Street โหลด

    Wait Until Element Is Visible    ${city}    timeout=5s
    Select From List By Label    ${city}   Provincia de Teruel
    Log To Console    Selected Teruel for Province . (เลือก Provincia de Teruel สำหรับ จังหวัด)
    Sleep    2s    # รอให้ Postal Code โหลด

    Wait Until Element Is Visible    ${street}    timeout=5s
    Select From List By Label    ${street}   Abejuela
    Log To Console    Selected Abejuela for District/Street. (เลือก Abejuela สำหรับเขต/ถนนแล้ว)
    Sleep    2s    # รอให้ Postal Code โหลด

    Scroll Element Into View    ${DELIVERY_POSTAL_CODE_DROPDOWN}
    Wait Until Element Is Visible    ${DELIVERY_POSTAL_CODE_DROPDOWN}    timeout=5s
    Select From List By Label    ${DELIVERY_POSTAL_CODE_DROPDOWN}    44422 - Abejuela
    Log To Console    Selected 44422 - Abejuela for Postal Code. (เลือก 44422 - Abejuela สำหรับรหัสไปรษณีย์แล้ว)

    Wait Until Element Is Visible    ${SHIPPING_FEE_CHECKBOX}    timeout=5s
    Click Element    ${SHIPPING_FEE_CHECKBOX}
    Log To Console    Ticked Shipping Fee checkbox. (ติ๊กช่องทำเครื่องหมายค่าจัดส่งแล้ว)

    Wait Until Element Is Visible    ${SHIPPING_FEE_INPUT}    timeout=5s
    Input Text    ${SHIPPING_FEE_INPUT}           50
    Log To Console    Filled Shipping Fee as 50. (กรอกค่าจัดส่งเป็น 50 แล้ว)

    Wait Until Element Is Visible    ${DELIVERY_ADDRESS_DETAILS}    timeout=5s
    Input Text    ${DELIVERY_ADDRESS_DETAILS}     test
    Log To Console    Filled Address Details with 'test'. (กรอกรายละเอียดที่อยู่เป็น 'test' แล้ว)

    Wait Until Element Is Visible    ${warehouse}    timeout=5s
    Select From List By Label    ${warehouse}     VMC
    Log To Console    Filled Warehouse with 'VMC'. (กรอกรายละเอียดโกดังเป็น 'VMC' แล้ว) 
    
    Wait Until Element Is Visible    ${nots}    timeout=5s
    Input Text    ${nots}     test
    Log To Console    Filled Note with 'test'. (กรอกรายละเอียดโน๊ต 'test' แล้ว)


 
    # Click Submit Button
    Log To Console    Clicking Submit button... (กำลังคลิกปุ่ม Submit...)
    Scroll Element Into View    ${SUBMIT_BUTTON}
    Wait Until Element Is Visible    ${SUBMIT_BUTTON}    timeout=5s
    Click Button    ${SUBMIT_BUTTON}
    Log To Console    Submitted Distributor form. (ส่งฟอร์ม Distributor แล้ว)
    Sleep    5s 

    Log To Console    Task completed. (งานเสร็จสมบูรณ์แล้ว)
    Sleep    10s 