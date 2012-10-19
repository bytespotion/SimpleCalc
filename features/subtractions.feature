Feature: Subtractions 
  In order to avoid mistakes users must be able to calculate a subtraction

  Scenario: Subtraction 4-2 = 2
    Given I am on the Welcome Screen
    When I touch "4"
    Then I should see a "4" in the screen
    And I touch "-"
    Then I should see a "4-" in the screen
    And I touch "2"
    Then I should see a "4-2" in the screen
    And I touch "="
    Then I should see a "2" in the screen

  Scenario: Subtraction 3-6 = 0
    Given I am on the Welcome Screen
    When I touch "3"
    Then I should see a "3" in the screen
    And I touch "-"
    Then I should see a "3-" in the screen
    And I touch "6"
    Then I should see a "3-6" in the screen
    And I touch "="
    Then I should see a "0" in the screen
