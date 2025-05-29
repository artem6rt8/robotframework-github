*** Settings ***
Library    SeleniumLibrary
Resource   variables.robot

*** Keywords ***
Login To OrangeHRM
    Open Browser    ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    Dashboard
Add Employee
    Click Element   xpath=//span[text()='PIM']
    Wait Until Page Contains Element    xpath=//button[contains(@class, 'oxd-button--secondary') and contains(., 'Add')]
    Click Element   xpath=//button[contains(@class, 'oxd-button--secondary') and contains(., 'Add')]
    Wait Until Page Contains Element    xpath=//h6[text()='Add Employee']
