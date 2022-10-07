*** Keywords ***

Close popup and select language
    common.Select language
    common.Close popup

Create list of brand img url
    [Arguments]    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible       id=main
    SeleniumLibrary.Wait Until Element Is Visible       ${locator}
    ${links}    Get WebElements                         ${locator}
    ${img_url}    BuiltIn.Create List
    FOR  ${link}  IN  @{links}
        ${link_style}        Get Element Attribute    ${link}    style
        ${link_url}    Evaluate    re.findall(r'url\\(\\"([^)^\\"]+)', $link_style)[0]        re
        Collections.Append To List    ${img_url}    ${link_url}
    END
    [Return]    ${img_url}

Create list of brand url
    [Arguments]    ${locator}
    ${links}    Get WebElements        ${locator}
    ${brand_url}    BuiltIn.Create List
    FOR  ${link}  IN  @{links}
        ${link_url}        Get Element Attribute    ${link}    href
        Collections.Append To List    ${brand_url}    ${link_url}
    END
    [Return]    ${brand_url}

Wait for element visible
    [Arguments]        ${locator}
    SeleniumLibrary.Wait until element is visible        ${locator}

Verify link to correct page
    [Arguments]        ${brand_name}
    ${current_url}    Get Location
    ${current_url}    Remove String    ${current_url}    https://shopee.co.th/
    Should Be Equal    ${current_url}        ${brand_name}

Page zoom out
    Execute Javascript    document.body.style.zoom = "5%"