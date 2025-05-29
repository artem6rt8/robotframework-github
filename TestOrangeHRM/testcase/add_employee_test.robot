*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource   ../resources/keywords.robot

*** Test Cases ***
Add New Employee
    [Documentation]    ทดสอบการ login และเพิ่มพนักงานใหม่
    Login To OrangeHRM

    Add Employee

    Input Text    name=firstName    Ausu
    Input Text    name=lastName     Fati
    sleep   5s
    Click Element         xpath=//button[@type='submit' and contains(., 'Save')]
    Wait Until Page Contains    Personal Details
    Page Should Contain    Personal Details 
    Close Browser
Add Employee Fails Without First Name
    [Documentation]     ทดสอบการเพิ่มพนักงานใหม่ไม่ใส่ชื่อหน้า
    Login To OrangeHRM

    Add Employee

    Input Text    name=firstName    ${EMPTY}
    Input Text    name=lastName     Fati

    sleep   5s
    Click Element         xpath=//button[@type='submit' and contains(., 'Save')]
    Page Should Contain    Required
    Close Browser
Add Employee Fails Without last Name
    [Documentation]     ทดสอบการเพิ่มพนักงานใหม่ไม่ใส่นามสกุล
  Login To OrangeHRM

  Add Employee

    Input Text    name=firstName    Ansu
    Input Text    name=lastName     ${EMPTY}

    sleep   5s
    Click Element         xpath=//button[@type='submit' and contains(., 'Save')]
    Page Should Contain    Required
    Close Browser
Add Employee Without Name
    [Documentation]     ทดสอบกรณีไม่กรอกชื่อและนามสกุล
  Login To OrangeHRM

  Add Employee

    Input Text    name=firstName    ${EMPTY}
    Input Text    name=lastName     ${EMPTY}

    sleep   5s
    Click Element         xpath=//button[@type='submit' and contains(., 'Save')]
    Page Should Contain    Required
    Close Browser
