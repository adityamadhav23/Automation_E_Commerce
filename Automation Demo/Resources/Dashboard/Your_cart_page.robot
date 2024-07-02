*** Settings ***
Resource    ../../Resources/Generic.robot
Resource    Get_product_list.robot


*** Variables ***




*** Keywords ***
Matching_all_product_in_cart
    FOR    ${product_name}    IN    @{productlist}
        ${item_name}=    Set Variable    xpath://div[@class='inventory_item_name' and text()='${product_name}']
        Wait Until Element Is Visible    xpath://div[@class='inventory_item_name' and text()='${product_name}']
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${item_name}

    END