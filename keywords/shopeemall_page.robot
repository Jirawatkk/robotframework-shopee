*** Keywords ***
Create list of brand img url
    SeleniumLibrary.Wait Until Element Is Visible        id=main
    # ${test}    Get WebElement    dom:document.querySelector('.ofs-carousel__items')
    # Scroll Element Into View    ${test}
    SeleniumLibrary.Wait Until Element Is Visible       xpath=//div[@class='ofs-carousel__header']
    Execute Javascript    window.scrollTo(0, 200)
    SeleniumLibrary.Wait Until Element Is Visible       xpath=//div[@class='ofs-carousel__cover-image owJZ7d']
    # SeleniumLibrary.Click Element        xpath=//div[@class='ofs-carousel__header']
    ${links}    Get WebElements        dom:document.querySelectorAll('.ofs-carousel__cover-image.owJZ7d')
    # Log To Console     ${links}
    ${img_url}    BuiltIn.Create List
    FOR  ${link}  IN  @{links}
        ${link_style}        Get Element Attribute    ${link}    style
        ${link_url}    Evaluate    re.findall(r'url\\(\\"([^)^\\"]+)', $link_style)[0]        re
        Log To Console        ${link_url}
        Collections.Append To List    ${img_url}    ${link_url}
    END
    Log To Console        ${img_url}