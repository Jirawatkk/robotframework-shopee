*** Settings ***
Resource    ${CURDIR}/../imports/imports.robot

Test Setup       SeleniumLibrary.Open browser        https://shopee.co.th    gc
Test Teardown    SeleniumLibrary.Close All Browsers

*** Test Cases ***
Test001
    home_feature.Check category list and select category
    shopeemall_feature.Sort product and verify list of img and third product

Test002
    home_feature.Check category list and select category
    shopeemall_feature.Check brand go to correct page

Test003
    home_feature.Check category list and select category
    all_brand_feature.Check first letter should valid

Test004
    home_feature.Check category list and select category
    all_brand_feature.Check list on mall is have in all brand page

Test005
    home_feature.Check category list and select category
    all_brand_feature.Check list on mall brand in all page will bring to correct page