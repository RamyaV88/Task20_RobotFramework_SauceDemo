# Resources\PageObject\KeywordDefinitionFiles\inventorypage.robot
*** Settings ***
# General documentation for this file
Documentation    This file contains detailed keyword definitions specifically designed for testing the various features of the inventory page on the SauceDemo website.

# Libraries used in this file
Library          SeleniumLibrary
Library          Collections

# Variables files for locators and test data
Variables        ../Locators/test_locators.py
Variables        ../TestData/test_data.py

*** Keywords ***
# Keyword to log out of the webpage
Logout of the Webpage
    Click Button    ${menu_button}
    Wait Until Element Is Visible    ${logout_button}
    Click Element    ${logout_button}

# Keyword to add items to the cart
Add Items To Cart
    [arguments]    ${list}
    FOR    ${item}    IN    @{list}
        ${locator} =    Get From Dictionary    ${inventory_items}    ${item}
        Click Button    ${locator}
    END

Add Multiple Items To Cart
    [arguments]    ${list}
    FOR    ${item}    IN    @{list}
        ${locator} =    Get From Dictionary    ${inventory_items}    ${item}
        Click Button    ${locator}
    END
# Keyword to navigate to the cart page
Go To Cart
    Click Element    ${cart_button}
    Location Should Be    ${cart_page_url}

# Keyword to collect a list of elements
Collect List Of Elements
    @{elements} =    Get Webelements    ${itemList_locator}
    ${list} =    Create List
    FOR    ${element}    IN    @{elements}
        ${text} =    Get Text    ${element}
        Log    ${text}    # Log the value to verify it's correctly fetched and converted
        Append To List    ${list}    ${text}
    END
    RETURN    ${list}