*** Settings ***
Library    SeleniumLibrary
Variables    ../Variables/default.py
Resource    Dashboard/Your_cart_page.robot
Resource    Dashboard/Get_product_list.robot
Resource    Dashboard/Add_to_cart.robot
Library    Testlib/Python_Libraries/Extended_library.py


