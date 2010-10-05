Feature: List Runners
  In order to see how the race went
  Runners should be able to see the results

  Scenario: List all runners, sorted by time
    Given the following runners:
      | name | number | time |
      | Eric | 1 | 18:00.24 |
      | Justin | 2 | 17:55.23 |
      | Eric Smith | 3 | 16:00.00 |
    When I go to the home page
    Then I should see the following runners:
      | Eric Smith| 3 | 16:00.00 |
      | Justin | 2 | 17:55.23 |
      | Eric | 1 | 18:00.24 |
