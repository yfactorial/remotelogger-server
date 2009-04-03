Feature: New application registration
  In order to log a remote application
  I need to be able to register an application
    
  Scenario: Application registration
    Given I am logged in as "ryan@test.com" from "Test Company"
    And I am on the new application page
    And I fill in "Name" with "Test App"
    When I press "Create"
    Then there should be a registered application "Test App" for "Test Company"
    And I should be on the "applications/info" page
    And I should see the application token for "Test App"