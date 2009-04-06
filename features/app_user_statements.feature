Feature: App statements
  In order to view application activity
  I need to be able to view the log statements for an app
    
  Scenario: View app statements
    Given I am logged in as "ryan@test.com" from "Test Company"
    And there are 30 log statements for "Test App" of "Test Company"
    When I visit the application statements page for "Test App"
    Then I should see the 1 set of log statements for the "Test App" application
    And I follow "Next"
    And I should see the 2 set of log statements for the "Test App" application