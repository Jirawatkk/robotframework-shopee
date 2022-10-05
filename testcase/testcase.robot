*** Settings ***
Library    SeleniumLibrary

Variables    ${CURDIR}/../testdata/testdata.yaml

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
    Scroll Element Into View        xpath=//*[@class='home-category-list__category-grid']
    Mouse Down        xpath=//div[@class='home-category-list']//div[@class='shopee-header-section__header']
    ${right_arrow}    Run Keyword And Return Status    Wait Until Element Is Visible        xpath=//div[@class="home-category-list"]//div[@class="carousel-arrow carousel-arrow--next carousel-arrow--hint"]
    IF  ${right_arrow}
        Click Element    xpath=//div[@class="home-category-list"]//div[@class="carousel-arrow carousel-arrow--next carousel-arrow--hint"]
    END
    
    
    ${category_list}    Get WebElements    dom:document.querySelectorAll('.home-category-list__category-grid')
    FOR  ${category}  IN  @{home_category}
        Log To Console        test ${category}
        Wait Until Element Is Visible    xpath=//div[contains(text(), '${category}')]
        # Wait Until Element Is Visible    xpath=//a[@class='home-category-list__category-grid']/div/div/div[contains(text(), '${category}')]
        # ${test}    Get Text     xpath=//a[@class='home-category-list__category-grid']/div/div/div[contains(text(), '${category}')]
    END
    
    
    # FOR  ${category}  IN  ${home_category}
    #     Log To Console        ${category}
    # END
    
