*** Keywords ***

Check first letter should valid
    all_brand_page.Wait for menu is visible
    all_brand_page.Go to all brand page
    all_brand_page.Check start letter should be valid

Check list on mall is have in all brand page
    ${mall_img_url}      common.Create list of brand img url    ${mall.img_locator}
    ${mall_brand_url}    common.Create list of brand url        ${mall.url_locator}
    all_brand_page.Go to all brand page
    common.Page zoom out
    ${all_img_url}      common.Create list of brand img url    ${all.img_locator}
    ${all_brand_url}    common.Create list of brand url        ${all.url_locator}
    all_brand_page.Validate mall brand img have in all brand        ${all_img_url}      ${mall_img_url}
    all_brand_page.Validate mall brand name have in all brand        ${all_brand_url}    ${mall_brand_url}