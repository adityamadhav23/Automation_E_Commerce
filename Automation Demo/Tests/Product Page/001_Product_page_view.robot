*** Settings ***
Resource    ../../Resources/Generic.robot
Resource    ../../Resources/Login Page/Login_Page.robot
Resource    ../../Resources/Dashboard/Add_to_cart.robot
Resource    ../../Resources/Dashboard/Get_product_list.robot
Library    Collections




*** Variables ***
${product_level_path}    xpath://div[@class='product_label']
${product_name}    Sauce Labs Fleece Jacket
${product_name_2}    Sauce Labs Bolt T-Shirt
${cart_val_index}    2
#${cart_xpath}    xpath://a[@class="shopping_cart_link fa-layers fa-fw"]



*** Test Cases ***
Verify_Dashboard_product_Navbar
    Login_to_the_Application_with_valid_credentials
    ${product_label}=    Get Text    ${product_level_path}
    Log To Console    ${product_label}
    Should Be Equal    Products    ${product_label}
    

 Verify_all_product_titles
    @{product_items}=    Selecting_all_the_product_titles
    Log    ${product_items}
    Set Global Variable    @{product_items}

Verify_initially_cart_value_is_zero
    ${cart_value}=    Check_count_upon_adding_a_element
    Should Be Equal    ${cart_value}    0


Verify_verifying_by_adding_product_to_cart
    FOR    ${product_name}    IN    @{productlist}
        ${item_index}=    Finding_the_index_of_mentioned_product    ${product_name}
        Add_element_to_the_cart    ${item_index}
        Creating_a_list_of_product_desc_price    ${item_index}     
    END


*** Keywords ***
