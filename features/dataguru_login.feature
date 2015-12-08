@smoke_test
Feature: Login

  Scenario Outline: Login Test
    When I open the login page
    And Input the "<username>" and "<password>"
    And I click the login button
    Then The current page should be home page after successful login

    Examples:
    |username|password|
    |a477993|11xiao24|

