Feature: Create Token

  Scenario: Create Token
    Given url 'http://app-ntsa-webjob-dev.chinacloudsites.cn'
    When method GET
    * def accessToken = response