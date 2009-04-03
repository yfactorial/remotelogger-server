Feature: New user registration
  In order to use the app
  I need to be able to register myself as a user
    
  Scenario: User registration
    Given I am on the register page
    And I fill in "Email" with "test@test.com"
    And I fill in "Password" with "password"
    And I fill in "Confirm Password" with "password"
    When I press "Register"
    Then I should be logged in as "test@test.com"
    And I should be on the new application page