Feature: Login

  Scenario Outline: Login
    When I open the dataguru login page
    And I input my "<username>" and "<password>"
    And I refer below DOC string;
    """
    [
      {"username":"a477993", "pw":"11xiao24", "privilege":"teacher"},
      {"username":"aaa", "pw":"aa", "privilege":"student"}
    ]
    """
    Then I refer below data table:
      | username | pw       | privilege |
      | a477993  | 11xiao24 | teacher   |
      | aaa      | aa       | student   |
    Examples:
      | username | password |
      | a477993  | 11xiao24 |
