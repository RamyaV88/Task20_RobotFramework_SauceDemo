# Resources\PageObject\KeywordDefinitionFiles\cartpage.robot
*** Settings ***
# General documentation for this file
Documentation    This file contains detailed keyword definitions specifically designed for testing the various features of the cart page on the SauceDemo website.

# Libraries used in this file
Library          SeleniumLibrary
Library          Collections

# Variables files for locators and test data
Variables        ../Locators/test_locators.py
Variables        ../TestData/test_data.py

# Resource files for additional keyword definitions
Resource         ../KeywordDefinitionFiles/inventorypage.robot

*** Keywords ***
# Keyword to verify items in the cart
Verify Items In Cart
    [arguments]    ${list}
    # Collect the list of current items in the cart
    ${current_items} =    Collect List Of Elements
    # Check if the collected items are equal to the expected list
    Lists Should Be Equal    ${list}    ${current_items}


