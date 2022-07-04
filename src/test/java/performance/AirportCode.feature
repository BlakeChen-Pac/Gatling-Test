Feature:AirportCodes

  Background:
#    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
#    * eval sleep(1000)
#    * url refDataService
#    * def dbHandler = Java.type('helpers.DBHandler')

  Scenario: Get AirportCodes PositiveCases
    Given url 'www.baidu.com'
    Given params { countryCode : 'CN', languageCode : 'EN'}
    When method GET
    Then status 200