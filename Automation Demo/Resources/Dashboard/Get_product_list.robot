*** Settings ***
Resource    ../../Resources/Generic.robot
Resource    ../../Resources/Login Page/Login_Page.robot
Resource    ../../Resources/Dashboard/Add_to_cart.robot
Library    Collections


*** Variables ***
${index}
${product_price_xpath}    xpath://div[@class="inventory_list"]//div[@class="inventory_item"][1]//div[@class="inventory_item_price"]



*** Keywords ***
Selecting_all_the_product_titles
    @{titles_element}=    Get WebElements    xpath://div[@class='inventory_item']/div[@class='inventory_item_label']/a/div[@class='inventory_item_name']
    ${titles}=    Create List
    FOR    ${element}    IN    @{titles_element}
        Log    ${element}
        ${title}=    Get Text    ${element}
        Append To List    ${titles}    ${title}
        
    END
    Log   ${titles}
    RETURN    ${titles}


Finding_the_index_of_mentioned_product
    [Arguments]    ${product_name}
    @{product_list}=    Selecting_all_the_product_titles

    FOR    ${i}    IN RANGE    len(${product_list})
       # Log To Console   ${i}
        ${item}=    Get From List    ${product_list}    ${i}
        Run Keyword If    '${item}' == '${product_name}'    Set Test Variable    ${index}    ${i}
        Log   ${index}
    END
    ${index_of_product}=    Evaluate    ${index}+1
    RETURN    ${index_of_product}


Find_the_product_value
    [Arguments]    ${i}
    @{product_list}=    Selecting_all_the_product_titles
    # Log To Console   ${i}
    ${item}=    Get From List    ${product_list}    ${i}
    RETURN    ${item}    


Creating_a_list_of_product_desc_price
    [Arguments]    ${i}
    ${product_name}=    Find_the_product_value    ${i}
    ${product_price}=    Get Text    xpath://div[@class="inventory_list"]//div[@class="inventory_item"][${i}]//div[@class="inventory_item_price"]
    Log To Console    ${product_name},${product_price}
    ${product_price_val}=    Remove Currency    ${product_price}
    Log    ${product_price}
    Log To Console   ${product_price_val}
    

    
