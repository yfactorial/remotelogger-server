Feature: User login
  In order to use the app
  I need to be able to login
    
  Scenario: User login
    Given "ryan@test.com" is a registered user with password "password"
    And I am on the login page    
    And I fill in "Email" with "ryan@test.com"
    And I fill in "Password" with "password"
    When I press "Login"
    Then I should be logged in
    And I should be on the "accounts/show" page