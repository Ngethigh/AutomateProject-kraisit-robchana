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
${PRODUCT_CENTER_NAV_LINK}    xpath=//a[contains(@href, '/product/list') and contains(., 'Product center')]
${PRODUCT_LINK}               xpath=//a[normalize-space()='Product']
${ADD_PRODUCT_BUTTON}         xpath=//button[contains(., 'Add Product')]

# Locators for Create Product Form
${Cigarette}             id:tax_product
${ProductName}           id:name
${ECIDCODE}              id:ecid_code
${Cat}                   id:category
${Brand}                 id:brand
${Series}                id:series_id
${Color}                 id:color_list
${addbtncolor}           xpath=//button[contains(., 'Add')]
${Length}                id:length
${Width}                 id:width
${Height}                id:height
${weight}                id:weight
${Commision}             id:commission
${ClientType}            xpath=//button[contains(., 'None selected')] 
${PDDescribe}            id:desc
${ELIGIBLE_CLIENT_TYPE_DROPDOWN}    xpath=//button[contains(@class, 'multiselect') and contains(@title, 'None selected')]
${DISTRIBUTOR_CHECKBOX}             xpath=//label[contains(@title, 'distributor')]/input
${STORE_CHECKBOX}                   xpath=//label[contains(@title, 'store')]/input
${CLIENT_TYPE_APPLY_BUTTON}         xpath=//button[contains(text(), 'Apply')]
${SUBMIT_BUTTON}                xpath=//button[@type='submit' and text()='Submit']
${OK_BUTTON_POPUP}              xpath=//button[text()='OK']

*** Test Cases ***
Navigate To Create Product Page
    [Tags]    Product
    Open And Navigate To Login Page
    Input Username    ${USERNAME}
    Enter Password    ${PASSWORD}
    Click Sign In Button
    Verify Login Was Successful
    Navigate To Create Product
    Fill Distributor Details

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

Navigate To Create Product
    Log To Console    Navigating to Product Center -> Product...
    Wait Until Element Is Visible    ${PRODUCT_CENTER_NAV_LINK}    timeout=20s
    Click Element    ${PRODUCT_CENTER_NAV_LINK}
    Log To Console    Clicked 'Product Center'. Waiting for 'Product' link to appear.

    Wait Until Element Is Visible    ${PRODUCT_LINK}    timeout=20s
    Click Element    ${PRODUCT_LINK}
    Log To Console    Clicked 'Product'.

    Wait Until Page Contains    Product List    timeout=20s
    Log To Console    On Product List page.

    Wait Until Page Contains Element    xpath=//table    timeout=20s
    Log To Console    Product table loaded.

    Wait Until Element Is Visible    ${ADD_PRODUCT_BUTTON}    timeout=20s
    Log To Console    Add Product button located: ${ADD_PRODUCT_BUTTON}
    Scroll Element Into View    ${ADD_PRODUCT_BUTTON}
    Sleep    2s
    Click Element    ${ADD_PRODUCT_BUTTON}
    Wait Until Page Contains    Create Product    timeout=20s
    Log To Console    Successfully navigated to 'Create Product' form.
    Sleep    7s

Fill Distributor Details
    Log To Console    Starting to fill Distributor form details...

    # Basic Info
    Wait Until Element Is Visible    ${Cigarette}    timeout=10s
    Input Text    ${Cigarette}          0.5
    Log To Console    Cigarette Liquids Tax

    Wait Until Element Is Visible    ${ProductName}    timeout=5s
    Input Text    ${ProductName}     Product Namtan
    Log To Console    Filled Product Name.

    Wait Until Element Is Visible    ${ECIDCODE}    timeout=5s
    Input Text    ${ECIDCODE}          200
    Log To Console    Filled ECID Code.

    Wait Until Element Is Visible    ${Cat}    timeout=5s
    Select From List By Value    ${Cat}    12
    Log To Console    Selected Category for Accessories.

    Wait Until Element Is Visible    ${brand}    timeout=5s
    Select From List By Value    ${brand}    2
    Log To Console    Selected Brand Glovap.

    Wait Until Element Is Visible    ${Series}    timeout=5s
    Select From List By Value    ${Series}    5
    Log To Console    Selected Series.

    Wait Until Element Is Visible    ${Color}     timeout=5s
    Select From List By Value    ${Color}     45
    Log To Console    Selected Color.

    Wait Until Element Is Visible    ${addbtncolor}     timeout=5s
    Click Element    ${addbtncolor} 
    Log To Console    Selected Color.

    Scroll Element Into View    ${Length}
    Wait Until Element Is Visible    ${Length}    timeout=5s
    Input Text    ${Length}    4
    Log To Console    Put text 4 for length

    Wait Until Element Is Visible    ${Width}    timeout=5s
    Input Text    ${Width}    4
    Log To Console    Put text 4 for Width

    Wait Until Element Is Visible    ${Height}    timeout=5s
    Input Text    ${Height}    4
    Log To Console    Put text 4 for Height

    Wait Until Element Is Visible    ${weight}    timeout=5s
    Input Text    ${weight}    4
    Log To Console    Put text 4 for weight

    Wait Until Element Is Visible    ${Commision}     timeout=5s
    Input Text    ${Commision}     4
    Log To Console    Put text 4 for commission

    Select Eligible Client Types
    
    Log To Console    Finished filling form.
    Sleep    3s

    # Submit form
    Scroll Element Into View    ${SUBMIT_BUTTON}
    Wait Until Element Is Visible    ${SUBMIT_BUTTON}    timeout=5s
    Click Button    ${SUBMIT_BUTTON}
    Log To Console    Submitted form.
    Sleep    5s 

    # Handle success popup
    Wait Until Element Is Visible    ${OK_BUTTON_POPUP}    timeout=10s 
    Click Button    ${OK_BUTTON_POPUP}
    Log To Console    Clicked OK on popup.
    Sleep    3s 

    Log To Console    Task completed.
    Sleep    10s

Select Eligible Client Types
    [Documentation]    เลือกทั้ง Distributor และ Store ใน Eligible Client Type
    Log To Console    Selecting Eligible Client Types...
    
    # คลิกปุ่ม dropdown เพื่อเปิดรายการเลือก
    Wait Until Element Is Visible    ${ELIGIBLE_CLIENT_TYPE_DROPDOWN}    timeout=10s
    Click Element    ${ELIGIBLE_CLIENT_TYPE_DROPDOWN}
    Log To Console    Opened Eligible Client Type dropdown
    
    # รอให้เมนูปรากฏและเลือกตัวเลือก
    Wait Until Element Is Visible    ${DISTRIBUTOR_CHECKBOX}    timeout=10s
    Scroll Element Into View         ${DISTRIBUTOR_CHECKBOX}
    Click Element    ${DISTRIBUTOR_CHECKBOX}
    Log To Console    Selected distributor
    
    Wait Until Element Is Visible    ${STORE_CHECKBOX}    timeout=5s
    Scroll Element Into View         ${STORE_CHECKBOX}
    Click Element    ${STORE_CHECKBOX}
    Log To Console    Selected Store
    
    # คลิกปุ่ม Apply เพื่อยืนยันการเลือก (ถ้ามี)
 
    Log To Console    Finished filling Invoice Info. (กรอกข้อมูลใบแจ้งหนี้เสร็จสิ้นแล้ว)
    Sleep    3s

    # Click Submit Button
    Log To Console    Clicking Submit button... (กำลังคลิกปุ่ม Submit...)
    Scroll Element Into View    ${SUBMIT_BUTTON}
    Wait Until Element Is Visible    ${SUBMIT_BUTTON}    timeout=5s
    Click Button    ${SUBMIT_BUTTON}
    Log To Console    Submitted Distributor form. (ส่งฟอร์ม Distributor แล้ว)
    Sleep    5s 


    Log To Console    Task completed. (งานเสร็จสมบูรณ์แล้ว)
    Sleep    10s 