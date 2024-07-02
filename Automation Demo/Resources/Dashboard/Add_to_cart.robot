*** Settings ***
Resource    ../../Resources/Generic.robot
Resource    Get_product_list.robot
*** Variables ***
${cart_count_path}    xpath://span[@class="fa-layers-counter shopping_cart_badge"]
${cart_val}




*** Keywords ***
Check_count_upon_adding_a_element
    
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${cart_count_path}
    ${cart_val}=    Run Keyword If    '${is_visible}' == 'True'    Get Text    ${cart_count_path}
    Run Keyword If    '${is_visible}' == 'False'    Set Test Variable    ${cart_val}    0
    Log To Console    ${cart_val}
    Log    ${cart_val} 
    RETURN    ${cart_val}



Add_element_to_the_cart
    [Arguments]    ${item_index}
    ${currenct_cart_count}=    Check_count_upon_adding_a_element
    Click Button    xpath://div[@class='inventory_item'][${item_index}]/div[@class='pricebar']/button[@class='btn_primary btn_inventory']
    ${product_item}=    Find_the_product_value    ${item_index}
    Log To Console    message="${product_item} is added"
    ${cart_count_upon_add}=    Check_count_upon_adding_a_element
    ${Expected_cart_value}=    Convert To String    ${currenct_cart_count}
    ${Expected_cart_value}=    Evaluate    ${Expected_cart_value}+1
    Should Be Equal As Integers     ${Expected_cart_value}    ${cart_count_upon_add}

   

    

     