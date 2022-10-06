*** Keywords ***
Select language
    SeleniumLibrary.Wait Until Element Is Visible        id=main
    SeleniumLibrary.Click Element       xpath=//button[contains(text(),'ไทย')]
    
Close popup
    ${popup}        SeleniumLibrary.Get WebElement       ${JSPath}
    BuiltIn.Run keyword and ignore error        SeleniumLibrary.Click Element       ${popup}

Check category list
    SeleniumLibrary.Scroll Element Into View        xpath=//*[@class='home-category-list__category-grid']
    SeleniumLibrary.Mouse Down        xpath=//div[@class='home-category-list']//div[@class='shopee-header-section__header']
    SeleniumLibrary.Wait Until Element Is Visible        xpath=//div[@class="home-category-list"]//div[@class="carousel-arrow carousel-arrow--next carousel-arrow--hint"]
    SeleniumLibrary.Click Element    xpath=//div[@class="home-category-list"]//div[@class="carousel-arrow carousel-arrow--next carousel-arrow--hint"]
    FOR  ${category}  IN  @{home_category}
        Log To Console        test ${category}
        SeleniumLibrary.Wait Until Element Is Visible    xpath=//div[contains(text(), '${category}')]
    END

Select category
    Click Element        xpath=//div[contains(text(), 'คอมพิวเตอร์และแล็ปท็อป')]