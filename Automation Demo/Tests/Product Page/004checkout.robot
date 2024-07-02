*** Settings ***
Resource    ../../Resources/Generic.robot
Resource    ../../Resources/Login Page/Login_Page.robot
Resource    ../../Resources/Dashboard/Add_to_cart.robot
Resource    ../../Resources/Dashboard/Get_product_list.robot
Library    Collections
Resource    001_Product_page_view.robot
Resource    Test.robot



*** Variables ***
${continue_button_xpath}    xpath://input[@class="btn_primary cart_button"]
${var1}    xpath://div[@class="cart_list"]//div[@class="cart_item"][1]//div[@class="cart_item_label"]//div[@class="inventory_item_name"]
${finish_button}    xpath://a[@class="btn_action cart_button"]
*** Test Cases ***
Click_on_continue
    Click Button    ${continue_button_xpath}

Click_on_finish
    Click Link    ${finish_button}