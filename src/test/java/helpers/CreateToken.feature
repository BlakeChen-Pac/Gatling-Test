Feature: Create Token

  Scenario: Create Token
    Given url ''
    When method GET
    * def accessToken = response