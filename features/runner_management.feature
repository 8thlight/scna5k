Feature: Runner Management
  In order to add runners
  An admin should be able to
  Add and remove runners

  @wip
  Scenario: Create new runner
    Given I am logged in
    And I follow "New Runner"
    When I fill in "Name" with "Chad Fowler"
    And I fill in "Number" with "123"
    And I fill in "Time" with "18:00.23"
    And I press "Create Runner"
    Then I should see "Chad Fowler"
    And I should see "123"
    And I should see "18:00.23"
    And I should be on the admin page

  @wip
  Scenario: Delete runner
    Given the following runners:
      |name|number|
      |Chad Fowler|123|
      |Micah Martin|456|
      |Paul Pagel|789|
    And I am logged in
    When I delete the 2nd runner
    Then I should not see "Micah Martin"
    And I should not see "456"
    And I should be on the admin page

  @wip
  Scenario: Edit runner
    Given the following runners:
      |name|number|time|
      |Eric Smith|123|22:00|
    And I am logged in
    When I edit the 1st runner
    And I fill in "Name" with "Paul Pagel"
    And I fill in "number" with "456"
    And I fill in "time" with "25:00"
    And I press "Update Runner"
    Then I should see "Paul Pagel"
    And I should see "456"
    And I should see "25:00"
    And I should be on the admin page
