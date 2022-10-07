*** Variables ***
${lang_locator}    xpath=//button[contains(text(),'${lang}')]
${main_locatot}    id=main
${regex_url}       re.findall(r'url\\(\\"([^)^\\"]+)', $link_style)[0]
${home_url}        https://shopee.co.th/
${zoom_script}     document.body.style.zoom = "5%"

*** Keywords ***

Close popup
    ${popup}        SeleniumLibrary.Get WebElement       ${JSPath}
    BuiltIn.Run keyword and ignore error        SeleniumLibrary.Click Element       ${popup}
    
Select language
    SeleniumLibrary.Wait Until Element Is Visible        ${main_locatot}
    SeleniumLibrary.Click Element                        ${lang_locator}

Create list of brand img url
    [Arguments]    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible       ${main_locatot}
    SeleniumLibrary.Wait Until Element Is Visible       ${locator}
    ${links}    Get WebElements                         ${locator}
    ${img_url}    BuiltIn.Create List
    FOR  ${link}  IN  @{links}
        ${link_style}                    Get Element Attribute    ${link}             style
        ${link_url}                      Evaluate                 ${regex_url}        re
        Collections.Append To List       ${img_url}               ${link_url}
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
    ${current_url}    Remove String    ${current_url}    ${home_url}
    Should Be Equal    ${current_url}        ${brand_name}

Page zoom out
    Execute Javascript    ${zoom_script}