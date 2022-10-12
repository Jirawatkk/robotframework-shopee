*** Keywords ***
Check first letter should valid
    all_brand_page.Wait for menu is visible
    all_brand_page.Go to all brand page
    all_brand_feature.Check start letter should be valid

Check list on mall is have in all brand page
    ${mall_img_url}      all_brand_feature.Create list of brand img url    ${mall_img_locator}
    ${mall_brand_url}    all_brand_feature.Create list of brand url        ${mall_url_locator}
    all_brand_page.Go to all brand page
    common.Page zoom out
    ${all_img_url}      all_brand_feature.Create list of brand img url    ${all_img_locator}
    ${all_brand_url}    all_brand_feature.Create list of brand url        ${all_url_locator}
    all_brand_page.Validate mall brand img have in all brand           ${all_img_url}      ${mall_img_url}
    all_brand_page.Validate mall brand name have in all brand          ${all_brand_url}    ${mall_brand_url}

Check list on mall brand in all page will bring to correct page
    Wait until page contains element    ${mall_url_locator}
    ${mall_url_locator}        all_brand_feature.Create list of brand url        ${mall_url_locator}
    all_brand_page.Go to all brand page

    FOR  ${url}  IN  @{mall_url_locator}
        ${url}    String.Remove String    ${url}    https://shopee.co.th
        ${mul_locator}    String.Replace string    ${mul_brand_locator}    $location    ${url}
        Wait until page contains element    ${mul_locator}
        SeleniumLibrary.Click element    ${mul_locator}
        common.Verify link to correct page        ${url}
        shopeemall_page.Back to previous page
    END

Check start letter should be valid
    SeleniumLibrary.Wait until element is visible    ${letter_bar_locator}
    ${alphabet}    SeleniumLibrary.Get webelements    ${list_letter_locator}
    FOR  ${index}    ${letter}  IN ENUMERATE    @{alphabet}
        ${first_letter}    SeleniumLibrary.Get text    ${letter}
        SeleniumLibrary.Click element    ${letter}
        ${list_section}    SeleniumLibrary.Get webelements    ${section_content_locator}
        FOR    ${section_index}      ${section}  IN ENUMERATE     @{list_section}
            ${letter_section}     SeleniumLibrary.Get webelements     ${section_content_locator}[${index}]
            ${brand_name_list}    SeleniumLibrary.Get webelements     ${letter_section}.${brand_name_list_locator}[${section_index}]
            FOR  ${brand_name}  IN  @{brand_name_list}
                ${name}    SeleniumLibrary.Get Text    ${brand_name}
                ${uppercase_name}    String.Convert to upper case        ${name}
                BuiltIn.Run keyword and continue on failure    BuiltIn.Should start with    ${uppercase_name}    ${first_letter}
            END
        END
    END

Create list of brand img url
    [Arguments]    ${locator}
    SeleniumLibrary.Wait until page contains element       ${locator}
    ${links}    SeleniumLibrary.Get WebElements                         ${locator}
    ${img_url}    BuiltIn.Create List
    FOR  ${link}  IN  @{links}
        ${link_style}                    SeleniumLibrary.Get Element Attribute    ${link}             style
        ${link_url}                      BuiltIN.Evaluate                 ${regex_url}        re
        Collections.Append To List       ${img_url}               ${link_url}
    END
    [Return]    ${img_url}

Create list of brand url
    [Arguments]    ${locator}
    ${links}    Get WebElements        ${locator}
    ${brand_url}    BuiltIn.Create List
    FOR  ${link}  IN  @{links}
        ${link_url}        SeleniumLibrary.Get Element Attribute    ${link}    href
        Collections.Append To List    ${brand_url}    ${link_url}
    END
    [Return]    ${brand_url}