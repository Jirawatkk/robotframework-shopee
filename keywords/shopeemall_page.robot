*** Keywords ***
Create list of brand img url
    SeleniumLibrary.Wait Until Element Is Visible       id=main
    SeleniumLibrary.Wait Until Element Is Visible       xpath=//div[@class='ofs-carousel__header']
    Execute Javascript    window.scrollTo(0, 200)
    SeleniumLibrary.Wait Until Element Is Visible       xpath=//div[@class='ofs-carousel__cover-image owJZ7d']
    ${links}    Get WebElements        dom:document.querySelectorAll('.ofs-carousel__cover-image.owJZ7d')
    ${img_url}    BuiltIn.Create List
    FOR  ${link}  IN  @{links}
        ${link_style}        Get Element Attribute    ${link}    style
        ${link_url}    Evaluate    re.findall(r'url\\(\\"([^)^\\"]+)', $link_style)[0]        re
        Collections.Append To List    ${img_url}    ${link_url}
    END

Create list of brand url
    ${links}    Get WebElements    dom:document.querySelectorAll('.ofs-carousel__shop-cover-image')
    ${brand_url}    BuiltIn.Create List
    FOR  ${link}  IN  @{links}
        ${link_url}        Get Element Attribute    ${link}    href
        Collections.Append To List    ${brand_url}    ${link_url}
    END

Select sort by options
    Click Element    xpath=//div[contains(text(), 'สินค้าขายดี')]
    # Scroll Element Into View        xpath=//div[@class='col-xs-2-4 shopee-search-item-result__item']

Select sort by price
    Mouse Over        xpath=//div[@class="select-with-status"]
    Click Element        xpath=//div[contains(text(), 'ราคา: จากน้อยไปมาก')]
    SeleniumLibrary.Wait Until Element Is Visible       xpath=//div[@class='col-xs-2-4 shopee-search-item-result__item']
    # Scroll Element Into View        xpath=//div[@class='col-xs-2-4 shopee-search-item-result__item']

Check third product on page
    ${third_product}    Get WebElements    xpath=//div[@data-sqe='name']/div[1]/div
    ${third_product_name}        Get Text        ${third_product}[2]
    Run Keyword And Continue On Failure    Should Be Equal       ${third_product_name}    'เม้าส์ไร้สาย MI'
    Log To Console        ${third_product_name}

Select brand
    Click Element        xpath=//a[contains(@href, 'itcity')]

Verify link to correct page
    ${current_url}    Get Location
    ${current_url}    Remove String    ${current_url}    https://shopee.co.th/
    Log To Console    ${current_url}
    Should Be Equal    ${current_url}        itcity

Go Back
    Execute Javascript    history.back()

