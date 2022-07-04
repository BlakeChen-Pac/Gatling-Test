Feature:AirportCodes

  Background:
#    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
#    * eval sleep(1000)
    * url refDataService
    * def dbHandler = Java.type('helpers.DBHandler')

  Scenario Outline: Get AirportCodes PositiveCases
    * eval dbHandler.executeSQL("DELETE FROM [D413CA_DEV_CN].[APD_BOSS].[TIBAPRT] WHERE APO_CD = '<APO_CD>'")
    * eval dbHandler.executeSQL("INSERT INTO [D413CA_DEV_CN].[APD_BOSS].[TIBAPRT] VALUES('<APO_CD>','<APO_NA>','<CNY_CD>','<POR_CD>',convert(varchar,'<UDT_TS> 00:00:00',120))")
    Given path '/api/v1/airport-code'
    Given params { countryCode : 'CN', languageCode : 'EN'}
    When method GET
    Then status 200
    And match response.data[*] contains
  """
    {
      "airportName": "<APO_NA>",
      "countryCode": "<CNY_CD>",
      "description": null,
      "airportCode": "<APO_CD>",
      "portCode": "<POR_CD>",
      "updateTimestamp": "<UDT_TS>T00:00:00",
      "originalDescription": "<APO_NA>"
     }
  """


    * eval dbHandler.executeSQL("DELETE FROM [D413CA_DEV_CN].[APD_BOSS].[TIBAPRT] WHERE APO_CD = '<APO_CD>'")


    Examples:
    |APO_CD|APO_NA|POR_CD|CNY_CD|UDT_TS    |
    |AM2   |AM2   |0001  |CN    |2000-01-01|

  Scenario Outline: Get AirportCodes NegativeCases
    Given path '/api/v1/airport-code'
    Given params { countryCode : '<countryCode>'}
    When method GET
    Then status 400
    And match response.errors == <expectResult>

    Examples:
      |countryCode|expectResult                                                         |
      |           |{"countryCode": ["The countryCode field is required."]}              |
      |CNA        |{"catchedExceptions": [#string]} |


  Scenario Outline: Get AirportCodesAuto PositiveCases
    * eval dbHandler.executeSQL("DELETE FROM [D413CA_DEV_CN].[APD_BOSS].[TIBAPRT] WHERE APO_CD = '<APO_CD>'")
    * eval dbHandler.executeSQL("INSERT INTO [D413CA_DEV_CN].[APD_BOSS].[TIBAPRT] VALUES('<APO_CD>','<APO_NA>','<CNY_CD>','<POR_CD>',convert(varchar,'<UDT_TS> 00:00:00',120))")
    Given path '/api/v1/airport-codeauto'
    Given params { countryCode : 'CN', languageCode : 'EN'}
    When method GET
    Then status 200
    And match response.data[*] contains
  """
    {
      "airportName": "<APO_NA>",
      "countryCode": "<CNY_CD>",
      "description": "<APO_NA>",
      "airportCode": "<APO_CD>",
      "portCode": "<POR_CD>",
      "updateTimestamp": "<UDT_TS>T00:00:00",
      "originalDescription": "<APO_NA>"
     }
  """


    * eval dbHandler.executeSQL("DELETE FROM [D413CA_DEV_CN].[APD_BOSS].[TIBAPRT] WHERE APO_CD = '<APO_CD>'")


    Examples:
      |APO_CD|APO_NA|POR_CD|CNY_CD|UDT_TS    |
      |AM2   |AM2   |0001  |CN    |2000-01-01|

  Scenario Outline: Get AirportCodesAuto NegativeCases
    Given path '/api/v1/airport-codeauto'
    Given params { countryCode : '<countryCode>'}
    When method GET
    Then status 400
    And match response.errors == <expectResult>

    Examples:
      |countryCode|expectResult                                                         |
      |           |{"countryCode": ["The countryCode field is required."]}              |
      |CNA        |{"catchedExceptions": [#string]} |
