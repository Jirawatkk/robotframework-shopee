*** Variables ***
${lang_locator}    xpath=//button[contains(text(),'${lang}')]
${main_locator}    id=main
${regex_url}       re.findall(r'url\\(\\"([^)^\\"]+)', $link_style)[0]
${home_url}        https://shopee.co.th/
${zoom_script}     document.body.style.zoom = "5%"

*** Keywords ***
Close popup
    Wait until page contains element    ${JSPath}
    ${popup}        SeleniumLibrary.Get WebElement       ${JSPath}
    BuiltIn.Run keyword and ignore error        SeleniumLibrary.Click Element       ${popup}

Select language
    SeleniumLibrary.Wait Until Element Is Visible        ${main_locator}
    SeleniumLibrary.Click Element                        ${lang_locator}

Wait for element visible
    [Arguments]        ${locator}
    SeleniumLibrary.Wait until element is visible        ${locator}

Verify link to correct page
    [Arguments]        ${locator}
    ${current_url}    SeleniumLibrary.Get Location
    ${current_url}    String.Remove String    ${current_url}    ${home_url}
    ${locator}        String.Remove String    ${locator}    /
    BuiltIn.Should Be Equal    ${current_url}        ${locator}

Page zoom out
    SeleniumLibrary.Execute Javascript    ${zoom_script}