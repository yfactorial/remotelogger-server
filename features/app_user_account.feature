Feature: User editing
  In order to maintain my account
  I need to be able to edit my account
    
  Scenario: Edit user account
    Given I am logged in as "ryan@test.com" from "Test Company"
    And I am on the edit account page    
    And I fill in "Email" with "ryan1@test1.com"
    And I fill in "Password" with "newpassword"
    And I fill in "Confirm Password" with "newpassword"
    And I press "Update"
    And I follow "Logout"
    And I login as "ryan1@test1.com" with password "newpassword"
    Then I should be logged in as "ryan1@test1.com"