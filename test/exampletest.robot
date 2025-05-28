*** Settings ***
Library    Browser    # ใช้ Browser Library สำหรับ Web UI testing
# หากคุณใช้ SeleniumLibrary ให้เปลี่ยนเป็น Library    SeleniumLibrary

*** Test Cases ***
Verify Google Search Page Title
    New Page    https://www.google.com
    Get Title    ==    Google
    Close Browser
