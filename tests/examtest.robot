*** Settings ***
Library    Browser    # ใช้ Browser Library

*** Test Cases ***
Verify Google Search Page Title
    [Documentation]    Opens Google and verifies the page title.
    New Page    https://www.google.com
    Get Title    ==    Google
    Close Browser

Verify DuckDuckGo Search Page Title
    [Documentation]    Opens DuckDuckGo and verifies the page title.
    New Page    https://duckduckgo.com/
    Get Title    ==    DuckDuckGo
    Close Browser
