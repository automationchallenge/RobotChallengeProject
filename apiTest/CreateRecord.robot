*** Settings ***
Library  RequestsLibrary
Library    JSONLibrary
Library  OperatingSystem
Library  Collections
Library  String
Library    ../Library/StandardRequestMethod.py
Library    ../Library/schemaValidation.py
Library    ../Library/convertToJsonObject.py
Variables  ../config/api_config.yaml

*** Test Cases ***
As the Clerk, I should be able to to insert a single record of working class hero into database via an API
    log to console  Create Single Record
    log to console      ${baseUrl}${insertSingleRecord}
    ${insertSingleRecordJson} =     Create Dictionary      birthday  ${birthDay}     gender      ${gender}   name    ${name}     natid   ${natid}    salary      ${salary}   tax   ${tax}
    log to console   ${insertSingleRecordJson}
    ${createSingleRecord} =   evaluate    json.dumps(${insertSingleRecordJson})    json
    log to console      ${createSingleRecord}
    ${response} =       postloginrequestservice       ${baseUrl}${insertSingleRecord}       ${createSingleRecord}
    Should Be Equal As Strings  ${response.status_code}  500
    log to console      ${response.text}


As the Clerk, I should be able to insert more than one working class hero into database via an API
    log to console  Create Multiple Record
    log to console      ${baseUrl}${insertMultipleRecord}
    ${inputJsonData} =     Convert To Json    ./input/multipleRecord.json
    ${input_data} =    evaluate    json.dumps(${inputJsonData})    json
    ${response} =       postloginrequestservice      ${baseUrl}${insertMultipleRecord}      ${input_data}
    Should Be Equal As Strings  ${response.status_code}  500
    ${actual_response} =    evaluate    json.dumps(${response.text})    json
    Validate Json Schema     ${actual_response}    ./expectedSchema/errorResponseSingleInsert.json





