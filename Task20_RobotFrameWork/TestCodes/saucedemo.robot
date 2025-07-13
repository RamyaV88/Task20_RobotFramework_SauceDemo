# TestCodes\checkout_page.robot
*** Settings ***
# General documentation for this test suite
Documentation    Test cases for the checkout page of the SauceDemo website.

# Libraries used in this test suite
Library          SeleniumLibrary
Library          Collections
Library          String

# Setup actions before the test
Test Setup       Open Webpage URL    ${browser_name}    ${webpage_url}

# Teardown actions after the test
Test Teardown    Close The Browser

# Variables files for locators and test data
Variables        ../Resources/PageObject/Locators/test_locators.py
Variables        ../Resources/PageObject/TestData/test_data.py

# Resource files for additional keyword definitions
Resource         ../Resources/PageObject/KeywordDefinitionFiles/generic.robot
Resource         ../Resources/PageObject/KeywordDefinitionFiles/loginpage.robot
Resource         ../Resources/PageObject/KeywordDefinitionFiles/inventorypage.robot
Resource         ../Resources/PageObject/KeywordDefinitionFiles/checkoutpage.robot
Resource         ../Resources/PageObject/KeywordDefinitionFiles/cartpage.robot

*** Test Cases ***
# Test case 1 - To validate successful login for a valid user and user lands to the inventory page
Validate Successful Login
    # Enter user credentials and login
    Enter User Credentials And Login   ${valid_username}    ${valid_password}
    # Verify that the login was successful by checking the home page URL
    Verify HomePage Login


# Test case 2 - To validate the error message for an invalid login attempt
Validate the Invalid Login Error Message
    Enter User Credentials And Login    ${invalid_username}    ${invalid_password}
    Verify Notification Message    ${login_error_element}    ${invalid_login_error_message}

# Test case 3 - To validate adding an item to the cart
Validate Add Item To Cart
    # Login to the webpage
    Login Into The Webpage
    # Add items to the cart
    Add Items To Cart    ${cart_one_item}
    # Go to the cart page
    Go To Cart
    # Verify the items in the cart
    Verify Items In Cart    ${cart_one_item}


# Test case 4 - To validate adding multiple items to the cart
Validate Add Multiple Items To Cart
    # Login to the webpage
    Login Into The Webpage
    # Add items to the cart
    Add Multiple Items To Cart    ${cart_list}
    # Go to the cart page
    Go To Cart
    # Verify the items in the cart
    Verify Items In Cart    ${cart_list}


# Test case 5 - To validate the complete checkout process of products
Validate Checkout Of Products
    # Login to the webpage
    Login Into The Webpage
    # Add items to the cart
    Add Multiple Items To Cart    ${cart_list}
    # Go to the cart page
    Go To Cart
    # Go to the checkout details page
    Go To Checkout Details
    # Add checkout details
    Add Checkout Details
    # Go to the checkout overview page
    Go To Checkout Overview
    # Complete the order
    Complete Order
    # Verify the checkout message
    Verify Checkout Message

