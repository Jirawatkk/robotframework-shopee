*** Variables ***
${brand_locator}    xpath=//a[contains(@href, '${brand_name_url}')]
${mul_brand_locator}    xpath=//a[contains(@href, '$location')]
${sort_by_option_locator}    xpath=//div[contains(text(), '${sort.sort_by_option}')]
${sort_by_price_locator}    xpath=//div[contains(text(), '${sort.sort_by_price}')]
${select_status_locator}    xpath=//div[@class="select-with-status"]
${js_command_back_page}    history.back()
${third_product_locator}    xpath=//div[@data-sqe='name']/div[1]/div
${menu_brand_locator}    xpath=//div[@class='ofs-carousel__items']
${search_item_result_locator}    xpath=//div[@class='col-xs-2-4 shopee-search-item-result__item']

*** Keywords ***
Select sort by options
    Wait until page contains element     ${sort_by_option_locator}
    SeleniumLibrary.Click element        ${sort_by_option_locator}

Select sort by price
    Wait until page contains element     ${sort_by_option_locator}
    SeleniumLibrary.Mouse over           ${select_status_locator}
    SeleniumLibrary.Click element        ${sort_by_price_locator}
    SeleniumLibrary.Wait until element is visible       ${search_item_result_locator}

Check third product on page
    ${third_product}    SeleniumLibrary.Get webelements    ${third_product_locator}
    ${third_product_name}        SeleniumLibrary.Get text        ${third_product}[2]
    BuiltIn.Run keyword and continue on failure    BuiltIn.Should be equal       ${third_product_name}    ${test_data_third_product}

Select brand
    SeleniumLibrary.Wait until element is visible    ${menu_brand_locator}
    SeleniumLibrary.Click element        ${brand_locator}

Select multiple brand
    [Arguments]    ${location}
    SeleniumLibrary.Wait until element is visible    ${menu_brand_locator}
    ${mul_brand_locator}    String.Replace string    ${mul_brand_locator}    $location    ${location}
    SeleniumLibrary.Click element        ${mul_brand_locator}

Back to previous page
    SeleniumLibrary.Execute javascript    ${js_command_back_page}