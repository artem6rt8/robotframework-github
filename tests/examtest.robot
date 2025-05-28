*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      https://www.saucedemo.com
${BROWSER}  firefox


*** Test Cases ***

Login ด้วยข้อมูลถูกต้อง
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:user-name    standard_user
    Input Text    id:password     secret_sauce
    Click Button  id:login-button
    Click Button  id:add-to-cart-sauce-labs-bike-light
    Click Element  class:shopping_cart_link
    Click Button   id:checkout
    Input Text     id:first-name     puwanart
    Input Text     id:last-name     jearat
    Input Text     id:postal-code   EXEE0012
    Click Button   id:continue
    Click Button   id:finish
    Page Should Contain    Thank you for your order!
    Close Browser
ไม่ใส่ชื่อ
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:user-name    standard_user
    Input Text    id:password     secret_sauce
    Click Button  id:login-button
    Click Button  id:add-to-cart-sauce-labs-bike-light
    Click Element  class:shopping_cart_link
    Click Button   id:checkout
    Click Button   id:continue
    Page Should Contain    Error: First Name is required
    Close Browser
ไม่ใส่ last name
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:user-name    standard_user
    Input Text    id:password     secret_sauce
    Click Button  id:login-button
    Click Button  id:add-to-cart-sauce-labs-bike-light
    Click Element  class:shopping_cart_link
    Click Button   id:checkout
    Input Text     id:first-name     puwanart
    Input Text     id:postal-code   EXEE0012
    Click Button   id:continue
    Page Should Contain    Error: Last Name is required
    Close Browser
ไม่ใส่Postal Code
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:user-name    standard_user
    Input Text    id:password     secret_sauce
    Click Button  id:login-button
    Click Button  id:add-to-cart-sauce-labs-bike-light
    Click Element  class:shopping_cart_link
    Click Button   id:checkout
    Input Text     id:first-name     puwanart
    Input Text     id:last-name     jearat
    Click Button   id:continue
    Page Should Contain    Error: Postal Code is required
    Close Browser
