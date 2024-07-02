*** Settings ***
Suite Setup    Check Condition
Test Setup     Check Run Condition
#Test Teardown  Reset Run Condition

*** Variables ***
${PRODUCT_CONFIG}    Corporate
${CONDITION_MET}     False

*** Test Cases ***


Example Test Case 1
    [Tags]    RunIfConditionMet
    Log To Console    Example Test Case 1 is running.

Example Test Case 2
    [Tags]    RunIfConditionMet
    Log To Console    Example Test Case 2 is running.

Example Test Case 3
    [Tags]    RunIfConditionMet
    Log To Console    Example Test Case 3 is running.

*** Keywords ***
Control Test Case
    [Documentation]    This test case checks if the condition is met.
    Run Keyword If    '${PRODUCT_CONFIG}' == 'Corporate'    Set Suite Variable    ${CONDITION_MET}    True

Check Condition
    Run Keyword And Continue On Failure    Control Test Case

Check Run Condition
    Run Keyword If    '${CONDITION_MET}' == 'False'    Skip    Condition not met, skipping test cases.

Reset Run Condition
    [Arguments]    ${status}    ${message}    ${tags}
    ${tags} =    Set Variable If    '${CONDITION_MET}' == 'False'    ${tags}    ['skip']
    Set Tags    ${tags}


*** Keywords ***
Set Product Config
    Run Keyword If    '${PRODUCT_CONFIG}' == 'Corporate'    Set Suite Variable    ${Api_Product_Config}    Department
    ...   ELSE IF    '${PRODUCT_CONFIG}' == 'Staffing'    Set Suite Variable    ${Api_Product_Config}    Client
    ...   ELSE    Set Suite Variable    ${Api_Product_Config}    test
