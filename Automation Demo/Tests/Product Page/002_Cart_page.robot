*** Settings ***
Resource    ../../Resources/Generic.robot
Resource    ../../Resources/Login Page/Login_Page.robot
Resource    ../../Resources/Dashboard/Add_to_cart.robot
Resource    ../../Resources/Dashboard/Get_product_list.robot
Library    Collections
Resource    001_Product_page_view.robot
Resource    Test.robot



*** Variables ***
#${cart_xpath}    xpath://a[@class="shopping_cart_link fa-layers fa-fw"]
${cart_test}    xpath://span[@class="fa-layers-counter shopping_cart_badge"]



*** Test Cases ***
Click_on_cart
    Click Element    ${cart_test}
    Matching_all_product_in_cart    


# Click_on_checkout
#     Click Link    ${button_xpath}  






           