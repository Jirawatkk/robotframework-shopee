*** Keywords ***

Sort product and verify list of img and third product
    ${mall_img_url}      common.Create list of brand img url    ${mall.img_locator}
    ${mall_brand_url}    common.Create list of brand url        ${mall.url_locator}
    shopeemall_page.Select sort by price
    shopeemall_page.Check third product on page

Check brand go to correct page
    shopeemall_page.Select brand
    common.Verify link to correct page        ${brand_name_url}
    shopeemall_page.Back to previous page