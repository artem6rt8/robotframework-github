*** Settings ***
Library    SeleniumLibrary    
Resource   ../resources/variables.robot 
Resource   ../resources/keywords.robot  

*** Test Cases ***
Add New Employee
    [Documentation]    ทดสอบการ login และเพิ่มพนักงานใหม่
    Login To OrangeHRM

    Click Element    xpath=//span[text()='PIM']
    Sleep    5s
    Click Element    xpath=//button[contains(@class, 'oxd-button--secondary') and contains(., 'Add')]
    Wait Until Page Contains Element    xpath=//h6[text()='Add Employee']

    Input Text    name=firstName    John
    Input Text    name=lastName     Doe
    Sleep    4s
    Click Element    xpath=//button[contains(@class,'oxd-button oxd-button--medium oxd-button--secondary')and contains(., 'Save')]
    Sleep    5s
    Page Should Contain    Personal Details
    Close Browser
