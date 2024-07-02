*** Settings ***
Resource    ../../Resources/Generic.robot
Resource    ../../Resources/Login Page/Login_Page.robot
Resource    ../../Resources/Dashboard/Add_to_cart.robot
Resource    ../../Resources/Dashboard/Get_product_list.robot
Library    Collections
Resource    001_Product_page_view.robot
Resource    Test.robot


*** Variables ***
${first_name}    aditya
${last_namme}    Madhav
${postal_code}    560065
${first_name_path}    xpath://input[@id='first-name']
${last_name_path}    xpath://input[@id='last-name']
${postal_code_path}    xpath://input[@id='postal-code']
${button_xpath}    xpath://a[@class="btn_action checkout_button"]  

*** Test Cases ***
Click_on_checkout
    Click link    ${button_xpath}  

Filling_out_information
    Input Text    ${first_name_path}    text=${first_name}
    Input Text    locator=${last_name_path}    text=${last_namme}
    Input Text    ${postal_code_path}    ${postal_code}

    
*** Keywords ***