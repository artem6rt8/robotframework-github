*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
Login To OrangeHRM
    # สร้าง temporary directory สำหรับ user-data-dir (ยังคงใช้ได้กับ Firefox)
    ${temp_dir}=    Get Temporary Directory
    ${user_data_dir}=    Join Paths    ${temp_dir}    firefox_profile # เปลี่ยนชื่อโฟลเดอร์สำหรับ Firefox

    # ใช้ FirefoxOptions แทน ChromeOptions
    ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method    ${firefox_options}    add_argument    --headless # Headless mode สำหรับ Firefox
    Call Method    ${firefox_options}    add_argument    --no-sandbox # สำคัญสำหรับ CI/CD
    Call Method    ${firefox_options}    add_argument    --width=1920 # กำหนดขนาดหน้าจอเสมือน
    Call Method    ${firefox_options}    add_argument    --height=1080 # กำหนดขนาดหน้าจอเสมือน
    Call Method    ${firefox_options}    set_preference    browser.download.folderList    2 # ตั้งค่าให้ไม่เปิด dialog ดาวน์โหลด
    Call Method    ${firefox_options}    set_preference    browser.download.manager.showWhenStarting    false
    Call Method    ${firefox_options}    set_preference    browser.download.dir    ${temp_dir}/downloads # กำหนดโฟลเดอร์ดาวน์โหลดชั่วคราว
    Call Method    ${firefox_options}    set_preference    dom.webdriver.enabled    false # ซ่อนสถานะ webdriver (บางเว็บอาจ detect)
    Call Method    ${firefox_options}    add_argument    --user-data-dir=${user_data_dir} # เพิ่ม user-data-dir

    # เปลี่ยนจาก chrome เป็น firefox และส่ง options ที่สร้างไว้
    Open Browser    ${URL}    ${BROWSER}    options=${firefox_options}
    # Maximize Browser Window # ไม่จำเป็นถ้าตั้ง window-size และเป็น headless

    Wait Until Page Contains Element    xpath=//input[@name='username']    timeout=10s
    Input Text    xpath=//input[@name='username']    ${USERNAME}
    Input Text    xpath=//input[@name='password']    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    Dashboard    timeout=15s
