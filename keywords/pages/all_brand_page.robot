*** Variables ***
${list_letter_locatot}              dom:document.querySelectorAll('.official-shop-brand-list__alphabet-letter-inner')
${section_content_locator}          dom:document.querySelectorAll('.official-shop-brand-list__section-content')
${brand_name_locator_chain}         .querySelectorAll('.full-brand-list-item__brand-name')


*** Keywords ***
Check start letter should be valid
    ${alphabet}    Get WebElements    ${list_letter_locatot}
    FOR  ${index}    ${letter}  IN ENUMERATE    @{alphabet}
        ${first_letter}    Get Text    ${letter}
        Click Element    ${letter}
        sleep     1
        ${list_section}    Get WebElements    ${section_content_locator}
        FOR    ${section_index}      ${section}  IN ENUMERATE     @{list_section}
            ${brand_name_list}    Get WebElements    ${section_content_locator}[${index}]${brand_name_locator_chain}[${section_index}]
            FOR  ${brand_name}  IN  @{brand_name_list}
                ${name}    Get Text    ${brand_name}
                ${uppercase_name}    String.Convert To Upper Case        ${name}
                Run Keyword And Continue On Failure    BuiltIn.Should Start With    ${uppercase_name}    ${first_letter}
                Log To Console     ${first_letter} ${uppercase_name}
            END
        END
    END

Validate mall brand img have in all brand
    [Arguments]        ${all_img_url}      ${mall_img_url}
    Collections.List Should Contain Sub List    ${all_img_url}      ${mall_img_url}
Validate mall brand name have in all brand
     [Arguments]       ${all_brand_url}    ${mall_brand_url}
     Collections.List Should Contain Sub List    ${all_brand_url}    ${mall_brand_url}
