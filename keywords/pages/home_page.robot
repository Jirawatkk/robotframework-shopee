** Variables ***
${JSPath}        dom:document.querySelector('shopee-banner-popup-stateful').shadowRoot.querySelector('.shopee-popup__close-btn')
${category_name_locator}            xpath=//div[contains(text(), '${category_name}')]
${category_locator}                 xpath=//div[contains(text(), '$category')]
${home_category_list_locator}       xpath=//*[@class='home-category-list__category-grid']
${header_section_locator}           xpath=//div[@class='home-category-list']//div[@class='shopee-header-section__header']
${arrow_next_locator}               xpath=//div[@class="home-category-list"]//div[@class="carousel-arrow carousel-arrow--next carousel-arrow--hint"]

*** Keywords ***
Select category
    SeleniumLibrary.Click element        ${category_name_locator}