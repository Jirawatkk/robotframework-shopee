*** Variables ***
${list_letter_locator}          dom:document.querySelectorAll('.official-shop-brand-list__alphabet-letter-inner')
${section_content_locator}      dom:document.querySelectorAll('.official-shop-brand-list__section-content')
${brand_name_list_locator}      .querySelectorAll('.full-brand-list-item__brand-name')
${letter_bar_locator}           xpath=//div[@class='official-shop-brand-list__alphabet-bar-wrapper']
${menu_locator}                 xpath=//div[@class='ofs-carousel__items']
${mall_img_locator}             dom:document.querySelectorAll('.ofs-carousel__cover-image.owJZ7d')
${mall_url_locator}             dom:document.querySelectorAll('.ofs-carousel__shop-cover-image')
${all_brand_locator}            xpath=//div[@class='ofs-page__section-header-see-all']
${all_img_locator}              dom:document.querySelectorAll('.full-brand-list-item__cover-image')
${all_url_locator}              dom:document.querySelectorAll('.full-brand-list-item__brand-cover-image')

*** Keywords ***
Validate mall brand img have in all brand
    [Arguments]        ${all_img_url}      ${mall_img_url}
    Collections.List should contain sub list    ${all_img_url}      ${mall_img_url}

Validate mall brand name have in all brand
     [Arguments]       ${all_brand_url}    ${mall_brand_url}
     Collections.List should contain sub list    ${all_brand_url}    ${mall_brand_url}

Wait for menu is visible
    SeleniumLibrary.Wait until element is visible    ${menu_locator}

Go to all brand page
    SeleniumLibrary.Wait until page contains element    ${all_brand_locator}
    SeleniumLibrary.Click Element        ${all_brand_locator}