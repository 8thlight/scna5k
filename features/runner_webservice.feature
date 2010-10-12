Feature: Runner Webservice
  In order to use my desktop client
  I should be able to
  Sync with a web service

  Scenario: Get runners
    Given the following runners:
      |name| number | time |
      |Eric Smith| 123 | 12:00|
      |Craig Demyanovich|456| 14:00|
    And I get runners
    Then I should have in my response the following runners:
      |name| number | time |
      |Eric Smith| 123 | 12:00|
      |Craig Demyanovich|456| 14:00|

  Scenario: Send runners
    Given there are no runners
    And the following users:
      | username | password |
      | eric | password |
    And I call send with the following runners:
      |name| number | time |
      |Eric Smith| 123 | 12:00|
      |Craig Demyanovich|456| 14:00|
    Then I should have the following runners
      |name| number | time |
      |Eric Smith| 123 | 12:00|
      |Craig Demyanovich|456| 14:00|

  Scenario: Send runners overwrites existing runners
    Given the following runners:
      |name| number | time |
      |Eric Smith| 123 | 12:00|
      |Craig Demyanovich|456| 14:00|
    And the following users:
      | username | password |
      | eric | password |
    And I call send with the following runners:
      |name| number | time |
      |Jim Suchy| 123 | 12:00|
      |Skim |456| 14:00|
    Then I should have the following runners
      |name| number | time |
      |Jim Suchy| 123 | 12:00|
      |Skim |456| 14:00|
