*** Variables ***

${list_letter_locatot}              dom:document.querySelectorAll('.official-shop-brand-list__alphabet-letter-inner')
${section_content_locator}          dom:document.querySelectorAll('.official-shop-brand-list__section-content')
${brand_name_locator_chain}         .querySelectorAll('.full-brand-list-item__brand-name')
${letter_bar_locator}               xpath=//div[@class='official-shop-brand-list__alphabet-bar-wrapper']
${menu_locator}                     xpath=//div[@class='ofs-carousel__items']

*** Keywords ***

Check start letter should be valid
    SeleniumLibrary.Wait until element is visible    ${letter_bar_locator}
    ${alphabet}    Get webelements    ${list_letter_locatot}
    FOR  ${index}    ${letter}  IN ENUMERATE    @{alphabet}
        ${first_letter}    Get text    ${letter}
        Log To Console    ${first_letter}
        SeleniumLibrary.Click element    ${letter}
        ${list_section}    Get webelements    ${section_content_locator}
        FOR    ${section_index}      ${section}  IN ENUMERATE     @{list_section}
        # locator under the comment cannot bring to variable or idk how to do
            ${brand_name_list}    Get webelements    dom:document.querySelectorAll('.official-shop-brand-list__section-content')[${index}].querySelectorAll('.full-brand-list-item__brand-name')[${section_index}]
            FOR  ${brand_name}  IN  @{brand_name_list}
                ${name}    Get Text    ${brand_name}
                ${uppercase_name}    String.Convert to upper case        ${name}
                Run keyword and continue on failure    BuiltIn.Should start with    ${uppercase_name}    ${first_letter}
            END
        END
    END

Validate mall brand img have in all brand
    [Arguments]        ${all_img_url}      ${mall_img_url}
    Collections.List should contain sub list    ${all_img_url}      ${mall_img_url}

Validate mall brand name have in all brand
     [Arguments]       ${all_brand_url}    ${mall_brand_url}
     Collections.List should contain sub list    ${all_brand_url}    ${mall_brand_url}

Wait for menu is visible
    Wait until element is visible    ${menu_locator}

Go to all brand page
    Click Element        ${mall.all_brand_locator}