# Resources\PageObject\KeywordDefinitionFiles\checkoutpage.robot
*** Settings ***
# General documentation for this file
Documentation    This file contains detailed keyword definitions specifically designed for testing the various features of the checkout page on the SauceDemo website.

# Libraries used in this file
Library          SeleniumLibrary
Library          Collections
Library          String

# Variables files for locators and test data
Variables        ../Locators/test_locators.py
Variables        ../TestData/test_data.py

# Resource files for additional keyword definitions
Resource         ../KeywordDefinitionFiles/generic.robot

*** Keywords ***
# Keyword to navigate to the checkout details page
Go To Checkout Details
    Navigate To WebPage    ${checkout_button}    ${checkout_page_url}[0]

# Keyword to navigate to the checkout overview page
Go To Checkout Overview
    Navigate To WebPage    ${continue_button}    ${checkout_page_url}[1]

# Keyword to add checkout details
Add Checkout Details
    Input Text    ${firstname_input}    ${first_name}
    Input Text    ${lastname_input}    ${last_name}
    Input Text    ${postalcode_input}    ${postal_code}

# Keyword to complete the order
Complete Order
    Navigate To WebPage    ${finish_button}    ${checkout_complete_page_url}

# Keyword to verify the checkout message
Verify Checkout Message
    Verify Notification Message    ${checkout_element}    ${checkout_message}[0]
    Page Should Contain    ${checkout_message}[1]
    Click Button    ${home_button}

