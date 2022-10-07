*** Variables ***

${brand_locator}    xpath=//a[contains(@href, '${brand_name_url}')]
${sort_by_option_locator}    xpath=//div[contains(text(), '${sort.sort_by_option}')]
${sort_by_price_locator}    xpath=//div[contains(text(), '${sort.sort_by_price}')]
${select_status_locator}    xpath=//div[@class="select-with-status"]
${js_command_back_page}    history.back()

*** Keywords ***

Select sort by options
    Click Element        ${sort_by_option_locator}

Select sort by price
    Mouse Over           ${select_status_locator}
    Click Element        ${sort_by_price_locator}
    SeleniumLibrary.Wait Until Element Is Visible       xpath=//div[@class='col-xs-2-4 shopee-search-item-result__item']

Check third product on page
    ${third_product}    Get WebElements    xpath=//div[@data-sqe='name']/div[1]/div
    ${third_product_name}        Get Text        ${third_product}[2]
    Run Keyword And Continue On Failure    Should Be Equal       ${third_product_name}    'เม้าส์ไร้สาย MI'

Select brand
    Wait until element is visible    xpath=//div[@class='ofs-carousel__items']
    Click Element        ${brand_locator}

Back to previous page
    Execute Javascript    ${js_command_back_page}