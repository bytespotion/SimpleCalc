Feature: Multiplications 
  In order to avoid mistakes users must be able to calculate a sum

  Scenario: Multiplication 3x2 = 6
    Given I am on the Welcome Screen
    When I touch "3"
    Then I should see a "3" in the screen
    And I touch "x"
    Then I should see a "3x" in the screen
    And I touch "2"
    Then I should see a "3x2" in the screen
    And I touch "="
    Then I should see a "6" in the screen

  Scenario: Multiplication 4x5 = 20
    Given I am on the Welcome Screen
    When I touch "4"
    Then I should see a "4" in the screen
    And I touch "x"
    Then I should see a "4x" in the screen
    And I touch "5"
    Then I should see a "4x5" in the screen
    And I touch "="
    Then I should see a "20" in the screen
