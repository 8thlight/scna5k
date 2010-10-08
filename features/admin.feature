Feature: Administration
  In order to manage the runners
  An administratrator should be able to add/delete/edit users

  Scenario: Login Successfully
    Given the following users:
      | username | password |
      | eric | password |
    When I go to the home page
    And I fill in the following:
      | username | eric |
      | password | password |
    And I press "login"
    Then I should be on the admin page

  Scenario: Login Unsuccessfully
    Given the following users:
      | username | password |
      | eric | password|
    When I go to the home page
    And I fill in the following:
      | username | eric |
      | password | wrong |
    And I press "login"
    Then I should be on the home page
    And I should see "Login failed"

  Scenario: A non-logged in user tries to go to the admin section
    Given the following users:
      | username | password |
      | eric | password |
    When I go to the admin page
    Then I should be on the home page

  Scenario: A non-logged in user tries to add an entrant
    Given the following users:
      | username | password |
      | eric | password |
    When I go to the new runner page
    Then I should be on the home page

  Scenario: A non-logged in user tries to edit an entrant
    Given the following runners:
      |name|number|time|
      |Chad Fowler|123|11:22.33|
      |Micah Martin|456|11:22.33|
      |Paul Pagel|789|11:22.33|
    When I try to edit runner with id 2
    Then I should be on the home page

  @wip
  Scenario: A non-logged in user tries to update an entrant
    Given the following runners:
      |name|number|time|
      |Chad Fowler|123|11:22.33|
      |Micah Martin|456|11:22.33|
      |Paul Pagel|789|11:22.33|
    When I try to update runner with id 2 to have the name "Fred"
    Then I should be on the home page
    And I should see "Micah Martin"
    And I should not see "Fred"

  @wip
  Scenario: A non-logged in user tries to delete an entrant
    Given the following runners:
      |name|number|time|
      |Chad Fowler|123|11:22.33|
      |Micah Martin|456|11:22.33|
      |Paul Pagel|789|11:22.33|
    When I try to delete runner with id 1
    Then I should be on the home page
    And I should see "Chad Fowler"

  @wip
  Scenario: A non-logged in user tries to create an entrant
    When I try to create a new runner
    Then I should be on the home page
