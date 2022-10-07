** Variables ***

${JSPath}                  dom:document.querySelector('shopee-banner-popup-stateful').shadowRoot.querySelector('.home-popup > .home-popup__background > .home-popup__content > .home-popup__close-area > .shopee-popup__close-btn')
${category_locator}        xpath=//div[contains(text(), '${category_name}')]
${home_category_list_locator}        xpath=//*[@class='home-category-list__category-grid']
${header_section_locator}        xpath=//div[@class='home-category-list']//div[@class='shopee-header-section__header']
${arrow_next_locator}        xpath=//div[@class="home-category-list"]//div[@class="carousel-arrow carousel-arrow--next carousel-arrow--hint"]

*** Keywords ***

Close popup
    ${popup}        SeleniumLibrary.Get WebElement       ${JSPath}
    BuiltIn.Run keyword and ignore error        SeleniumLibrary.Click Element       ${popup}

Check category list
    SeleniumLibrary.Scroll Element Into View             ${home_category_list_locator}
    SeleniumLibrary.Mouse Down                           ${header_section_locator}
    SeleniumLibrary.Wait Until Element Is Visible        ${arrow_next_locator}
    SeleniumLibrary.Click Element                        ${arrow_next_locator}
    FOR  ${category}  IN  @{home_category}
        SeleniumLibrary.Wait Until Element Is Visible    xpath=//div[contains(text(), '${category}')]
    END

Select category
    Click Element        ${category_locator}