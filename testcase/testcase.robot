*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${JSPath}        dom:document.querySelector('shopee-banner-popup-stateful').shadowRoot.querySelector('.home-popup > .home-popup__background > .home-popup__content > .home-popup__close-area > .shopee-popup__close-btn')

*** Keywords ***


*** Test Cases ***
Test001
    SeleniumLibrary.Open browser        https://shopee.co.th    gc
    SeleniumLibrary.Wait Until Element Is Visible        id=main
    SeleniumLibrary.Click Element       xpath=//button[contains(text(),'ไทย')]

    ${popup}        SeleniumLibrary.Get WebElement       ${JSPath}
    ${is_popup_visible}        BuiltIn.Run keyword and return status   BuiltIn.Should Not Be Equal   ${popup}    ${None}
    IF    ${is_popup_visible}        
        SeleniumLibrary.Click Element       ${popup}
    END

    
