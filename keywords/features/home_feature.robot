*** Keywords ***
Check category list and select category
    common.Select language
    common.Close popup
    SeleniumLibrary.Scroll element into view             ${home_category_list_locator}
    SeleniumLibrary.Mouse Down                           ${header_section_locator}
    SeleniumLibrary.Wait until element is visible        ${arrow_next_locator}
    SeleniumLibrary.Click element                        ${arrow_next_locator}
    FOR  ${category}  IN  @{home_category}
        ${category_locator}    String.Replace string     ${category_locator}    $category    ${category}
        SeleniumLibrary.Wait until page contains element    ${category_locator}
    END
    home_page.Select category