*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot

*** Test Cases ***
Login With Valid Credentials
    Open Browser    ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains Element    xpath=//h6[text()='Dashboard']
    Page Should Contain    Dashboard
    Close Browser
