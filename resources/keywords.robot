*** Settings ***
Library    SeleniumLibrary
Resource   variables.robot

*** Keywords ***
Login To OrangeHRM
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    5s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    Dashboard
