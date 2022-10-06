*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

Resource    ${CURDIR}/../keywords/home_page.robot
Resource    ${CURDIR}/../keywords/shopeemall_page.robot

Variables    ${CURDIR}/../testdata/testdata.yaml


Test Setup     SeleniumLibrary.Open browser        https://shopee.co.th    gc

*** Variables ***
${JSPath}        dom:document.querySelector('shopee-banner-popup-stateful').shadowRoot.querySelector('.home-popup > .home-popup__background > .home-popup__content > .home-popup__close-area > .shopee-popup__close-btn')

*** Test Cases ***
Test001
    Select language
    Close popup
    Check category list
    Select category
    
    Create list of brand img url
    Create list of brand url

    Select sort by price
    Check third product on page

    # Scroll Element Into View    xpath=//div[@class='container zj3slD']//ul[@class='image-carousel__item-list']
    Select brand
    Verify link to correct page
    Go Back
    Click Element    xpath=//div[@class='ofs-page__section-header-see-all']
    Log To Console     suxxess
    
    
