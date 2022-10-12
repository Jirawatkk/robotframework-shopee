*** Keywords ***
Sort product and verify list of img and third product
    shopeemall_page.Select sort by options
    shopeemall_page.Select sort by price
    shopeemall_page.Check third product on page

Check brand go to correct page
    shopeemall_page.Select brand
    common.Verify link to correct page        ${brand_name_url}
    shopeemall_page.Back to previous page