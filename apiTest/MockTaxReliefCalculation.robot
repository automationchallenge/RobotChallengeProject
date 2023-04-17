*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           ../Library/convertToJsonObject.py
Library           ../Library/checkMaskedValue.py
Library           ../Library/calculateVariablePercent.py
Library           ../Library/calculateTaxRelief.py

*** Test Cases ***
As the Governor, I should be able to see a button on the screen so that I can dispense tax relief for my working class heroes
    ${headers}=     Create Dictionary      Content-Type=application/json
    ${inputJsonData} =     Convert To Json    ./input/multipleRecord.json
    ${createInputRecord} =   evaluate    json.dumps(${inputJsonData})    json
    ${response}=  Create Dictionary     body=${createInputRecord}     headers=${headers}      status_code=200
    ${mock}=    MockHttpRequests
    ${url}=     Set Variable        ${baseUrl}${getTaxRecord}
    ${method}=      Set Variable  GET
    ${mock}.add_mock_response   (${url},   ${method},  ${response})
    ${result}=  Get Request  ${url}
    Should Be Equal As Strings  ${result.content}  ${inputJsonData}
    ${response_data}=    Evaluate    json.loads($response)    json
    ${length}=  Get length  ${response_data}
    FOR    ${index}    IN RANGE    1    ${length}
        Should Be Equal  Check Masked       ${response_data[${index}][natid]}      True
        ${variable}=    Calculate Variable Percent     ${response_data[${index}][birthday]}
        ${tax_relief}=      Calculate Tax Relief     ${variable}    ${response_data[${index}][gender]}      ${response_data[${index}][salary]}      ${response_data[${index}][tax]}
        Log To Console   ${tax_relief}