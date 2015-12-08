Feature: Test framework

  
  Scenario Outline: Open Browser
    When I want open "<web_site>" via the browser

    Examples:
    |web_site|
    |http://wwww.baidu.com|

