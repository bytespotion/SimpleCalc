Feature: Calculate 
  In order to avoid mistakes users must be able to calculate a sum

  Scenario: Sum 3+2 = 5
    Given I am on the Welcome Screen
    When I touch "3"
    And I touch "+"
    And I touch "2"
    And I touch "="
    Then I should see a "5" in the screen

    Scenario: Sum 4+5 = 9
      Given I am on the Welcome Screen
      When I touch "4"
      And I touch "+"
      And I touch "5"
      And I touch "="
      Then I should see a "9" in the screen
