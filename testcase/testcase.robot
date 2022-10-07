*** Settings ***

Resource    ${CURDIR}/../imports/imports.robot


# Suite Setup     SeleniumLibrary.Open browser        https://shopee.co.th    gc

*** Test Cases ***
Test001
    SeleniumLibrary.Open browser        https://shopee.co.th    gc
    common.Select language
    home_page.Close popup
    home_page.Check category list
    home_page.Select category
    
    ${mall_img_url}      common.Create list of brand img url    ${mall.img_locator}
    ${mall_brand_url}    common.Create list of brand url        ${mall.url_locator}

    shopeemall_page.Select sort by price
    shopeemall_page.Check third product on page

    shopeemall_page.Select brand
    common.Verify link to correct page        ${brand_name_url}
    shopeemall_page.Back to previous page

Test002
    Open Browser    https://shopee.co.th/mall/brands/11044958    gc
    common.Select language
    all_brand_page.Check start letter should be valid
    common.Page zoom out
    ${all_img_url}      common.Create list of brand img url    ${all.img_locator}
    ${all_brand_url}    common.Create list of brand url        ${all.url_locator}

Test003
    SeleniumLibrary.Open browser        https://shopee.co.th    gc
    common.Select language
    home_page.Close popup
    home_page.Check category list
    home_page.Select category
    ${mall_img_url}      common.Create list of brand img url    ${mall.img_locator}
    ${mall_brand_url}    common.Create list of brand url        ${mall.url_locator}
    Click Element        ${mall.all_brand_locator}
    common.Page zoom out
    ${all_img_url}      common.Create list of brand img url    ${all.img_locator}
    ${all_brand_url}    common.Create list of brand url        ${all.url_locator}
    
    all_brand_page.Validate mall brand img have in all brand        ${all_img_url}      ${mall_img_url}
    all_brand_page.Validate mall brand name have in all brand    ${all_brand_url}    ${mall_brand_url}

