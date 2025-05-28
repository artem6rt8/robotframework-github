*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   variables.robot

*** Keywords ***
Login To OrangeHRM
    # สร้าง temporary directory สำหรับ user-data-dir
    ${temp_dir}=    Get Temporary Directory
    ${user_data_dir}=    Join Paths    ${temp_dir}    firefox_profile

    # ใช้ FirefoxOptions แทน ChromeOptions
    ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
    Call Method    ${firefox_options}    add_argument    --headless
    Call Method    ${firefox_options}    add_argument    --no-sandbox
    Call Method    ${firefox_options}    add_argument    --width=1920
    Call Method    ${firefox_options}    add_argument    --height=1080
    Call Method    ${firefox_options}    set_preference    browser.download.folderList    2
    Call Method    ${firefox_options}    set_preference    browser.download.manager.showWhenStarting    false
    Call Method    ${firefox_options}    set_preference    browser.download.dir    ${temp_dir}/downloads
    Call Method    ${firefox_options}    set_preference    dom.webdriver.enabled    false
    Call Method    ${firefox_options}    add_argument    --user-data-dir=${user_data_dir}

    Open Browser    ${URL}    ${BROWSER}    options=${firefox_options}

    Wait Until Page Contains Element    xpath=//input[@name='username']    timeout=10s
    Input Text    xpath=//input[@name='username']    ${USERNAME}
    Input Text    xpath=//input[@name='password']    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    Dashboard    timeout=15s
