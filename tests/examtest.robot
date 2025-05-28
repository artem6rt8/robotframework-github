*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Login To OrangeHRM
    # เพิ่ม options สำหรับ headless mode และอื่นๆ ที่จำเป็น
    # '--no-sandbox' จำเป็นมากสำหรับ Docker/CI environments
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless=new # Headless mode (สำหรับ Chrome 94+)
    Call Method    ${chrome_options}    add_argument    --no-sandbox # สำคัญมากสำหรับ CI/CD
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage # ช่วยเรื่อง memory ใน Docker/CI
    Call Method    ${chrome_options}    add_argument    --disable-gpu # ป้องกันปัญหาบางอย่างเกี่ยวกับ GPU
    Call Method    ${chrome_options}    add_argument    --window-size=1920,1080 # กำหนดขนาดหน้าจอเสมือน

    Open Browser    ${BASE_URL}    chrome    options=${chrome_options}
    # Maximize Browser Window # ไม่จำเป็นถ้าตั้ง window-size และเป็น headless
    Wait Until Page Contains Element    xpath=//input[@name='username']    timeout=10s
    Input Text    xpath=//input[@name='username']    ${USERNAME}
    Input Text    xpath=//input[@name='password']    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    Dashboard    timeout=15s
