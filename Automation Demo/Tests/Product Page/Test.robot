*** Settings ***
Resource    ../../Resources/Generic.robot
Resource    ../../Resources/Login Page/Login_Page.robot
Resource    ../../Resources/Dashboard/Add_to_cart.robot
Library    Collections
Library    String
Library    JSONLibrary
Library           JSONLibrary
Variables    ../../Variables/default.py
Library         ../../Resources/Testlib/Python_Libraries/Extended_library.py
Suite Setup       Set Product Config

*** Variables ***
${index}
${BVname1}    Generate Random String    5    [LOWER]
${BVname2}    Generate Random String    5    [LOWER]
${testing}    123
${testngvalues1}    ${testing}
${test}    Yes

${RESPONSE_JSON}    [{"mastervalue": [{"key1": "Parent 1"},{"key1": "Parent 2"},{"key1": "Parent 3"},{"key1": "Parent 4"}]}]
${json_string}    {"mastervalue": [{"key1": "yhede"}, {"key1": "aafwy"}, {"key1": "uucqm"}, {"key1": "fspcy"}, {"key1": "evcpd"}, {"key1": "loygg"}]}
${PRODUCT_CONFIG}    Corporate
${DEFAULT_CONFIG}    Default Value


*** Test Cases ***
Test 2
    ${var1}=    Set Variable    23
    ${var2}=    Set Variable    25
    ${var 3}=    Set Variable    ${list1}
    ${total}=    Evaluate    ${var1}+${var2}
    Log To Console    ${total}
    Log To Console    ${list1}


Test 3
#    Log To Console    ${var1}
    @{BV_list}=    Create List    
    FOR    ${counter}    IN RANGE    0    4    
        ${BVname1}=    Generate Random String    5    [LOWER]
        Append To List    ${BV_list}    ${BVname1}
        
    END
    Log To Console    ${BV_list}


Test 4
    ${var1}=    Set Variable    {"error": false, "statusCode": 200, "message": "Success!", "data": [{"fieldname": "Testing Text Area", "fieldid": "6645e7a0a445020db57dab98", "customIdentifier": "TXT_OTHER_1715857312798_TESTING_TEXT_AREA", "mastervalue": [{}]}, {"fieldname": "Testing text box", "fieldid": "6645e7bca445020db57dab99", "customIdentifier": "TXT_OTHER_1715857340321_TESTING_TEXT_BOX", "mastervalue": [{}]}, {"fieldname": "Testing Dropdown", "fieldid": "6645e86115d654ff508102be", "customIdentifier": "TXT_OTHER_DROPDOWN_1715857505350_TESTING_DROPDOWN", "mastervalue": [[{"key1": "Val 2"}, {"key1": "Val 1"}]]}, {"fieldname": "Test Datepicker", "fieldid": "6645e8860ce1d8163bb45155", "customIdentifier": "TXT_OTHER_DATE_1715857542495_TEST_DATEPICKER", "mastervalue": []}, {"fieldname": "Test child field", "fieldid": "6645e8d2a445020db57dab9a", "customIdentifier": "TXT_OTHER_DROPDOWN_1715857618772_TEST_CHILD_FIELD", "mastervalue": [[{"Val 2": "test 2"}, {"Val 1": "test 1"}]]}, {"fieldname": "Test Auto Suggestion", "fieldid": "6645e965e0ceec94acc15c7f", "customIdentifier": "TXT_OTHER_AUTO_SUGGESTION_1715857765535_TEST_AUTO_SUGGESTION", "mastervalue": [[{"key1": "val 3"}, {"key1": "val 2"}, {"key1": "val 1"}]]}, {"fieldname": "Test check box", "fieldid": "6645e9a20ce1d8163bb45156", "customIdentifier": "TXT_OTHER_CHECK_BOX_1715857826841_TEST_CHECK_BOX", "mastervalue": [[{"key1": "Val 2"}, {"key1": "Val 1"}]]}, {"fieldname": "Testing Multi Selection", "fieldid": "6645ea1ce0ceec94acc15c80", "customIdentifier": "TXT_OTHER_MULTI_1715857948539_TESTING_MULTI_SELECTION", "mastervalue": [[{"key1": "Val 3"}, {"key1": "val 2"}, {"key1": "Val 1"}]]}, {"fieldname": "Test for dropdown from API user 1", "fieldid": "665d4e9a04f3221d80111091", "customIdentifier": "TXT_OTHER_DROPDOWN_1717391002074_TEST_FOR_DROPDOWN_FROM_API_USER_1", "mastervalue": [[{"key1": "value 1"}, {"key1": "value 2"}, {"key1": "value 3"}, {"key1": "value 4"}]]}, {"fieldname": "Test for dropdown parent", "fieldid": "665f0cba646a4f78f1e63940", "customIdentifier": "TXT_OTHER_DROPDOWN_1717505210419_TEST_FOR_DROPDOWN_PARENT", "mastervalue": [[{"key1": "Parent 1"}, {"key1": "Parent 2"}, {"key1": "Parent 3"}, {"key1": "Parent 4"}]]}]}
    Log To Console    ${var1}
    ${json_response}=    Convert String To Json    ${var1}
    Log To Console    ${json_response}
    # Extract the 'data' array from the JSON response
    ${data}=    Get Value From Json    ${json_response}    data
    
    # Initialize an empty dictionary to store fieldid and mastervalue
    ${fieldid_to_mastervalue}=    Create Dictionary
    
    # Loop through each item in the 'data' array
    FOR    ${item}    IN    @{data}:
        ${fieldid}=    Get From Dictionary    ${item}    fieldid
        ${mastervalue}=    Get From Dictionary    ${item}    mastervalue
    END
    # Add the fieldid and mastervalue to the dictionary
        Set To Dictionary    ${fieldid_to_mastervalue}    ${fieldid}    ${mastervalue}
    
    # Log the dictionary for verification
    Log    ${fieldid_to_mastervalue}

    # Optionally, you can perform more actions with the dictionary
    # For example, storing it in a suite variable or writing it to a file
    Set Suite Variable    ${MASTERVALUES_BY_FIELDID}    ${fieldid_to_mastervalue}




*** Test Cases ***
Create Specified Number Of Objects
    ${result}=    create_objects_for_other_field_api    4
    Log    ${result}
    Should Be Equal    ${result}    {'mastervalue': [{'key1': 'Parent 1'}, {'key1': 'Parent 2'}, {'key1': 'Parent 3'}, {'key1': 'Parent 4'}]}



Create List And Convert To JSON
    # Create a list with numbers
    ${numbers}=    Create List    1    2    3    4    5

    # Log the list for verification
    Log To Console    ${numbers}

    # Convert the list to JSON string
    ${json_string}=    Evaluate    json.dumps(${numbers})    json

    # Log the JSON string
    Log To Console    ${json_string}

    # Assert the JSON string is as expected
    Should Be Equal    ${json_string}    [1, 2, 3, 4, 5]




Extract Parent Values Into List
    # Parse the JSON response
    ${data}=    Evaluate    json.loads('''${RESPONSE_JSON}''')    json
    
    Log To Console   ${data}
    # Extract the list of parents
    ${parent_values}=    Evaluate    [item['key1'] for item in ${data}[0]['mastervalue']]

    # Log the list of parent values
    Log    ${parent_values}

    # Assert the list of parent values is as expected
    Should Be Equal    ${parent_values}    [Parent 1, Parent 2, Parent 3, Parent 4]


Extract Key1 Values
    # Parse the JSON string
    ${json_data}=    Convert String To Json    ${json_string}
    
    # Initialize an empty list to store key1 values
    ${key1_values}=  Create List
    
    # Extract the mastervalue list
    ${mastervalue_list}=    Get From Dictionary    ${json_data}    mastervalue    default
    
    # Loop through each dictionary in the mastervalue list and extract key1 values
    FOR    ${item}    IN    @{mastervalue_list}
        ${key1_value}=    Get From Dictionary    ${item}    key1    default
        Append To List    ${key1_values}    ${key1_value}
    END
   # Get From Dictionary    ${json_data}[0]    mastervalue    default
    
    # Log the resulting list
    Log To Console    ${key1_values}



Example Test Case
   # Run Keyword If    '${PRODUCT_CONFIG}' == 'Corporate'    ${Config}=    Set Variable    Department
   # Log    ${Config}    
   # ${Config}=    Run Keyword If    '${PRODUCT_CONFIG}' == 'Corporate'    Set Variable    Department
    Log To Console   ${Api_Product_Config}



*** Keywords ***
DefaultTestSuiteSetup
    ${Api_Product_Config}=    Run Keyword If    '${PRODUCT_CONFIG}' == 'Corporate'    Set Variable    Department
    ...   ELSE IF    '${PRODUCT_CONFIG}' == 'Staffing'    Set Variable    Client
    RETURN    ${Api_Product_Config}


Set Product Config
    ${Api_Product_Config}=    Run Keyword If    '${PRODUCT_CONFIG}' == 'Corporate'    Set Variable    Department
    ...   ELSE IF    '${PRODUCT_CONFIG}' == 'Staffing'    Set Variable    Client
    ...   ELSE    Set Variable    ${DEFAULT_CONFIG}    
