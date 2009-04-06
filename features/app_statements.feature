Feature: Application statements
  In order to view a summary of the activity on an application
  I need to be able to view the application statements
    
  Scenario: View application statements
    Given I am logged in as "ryan@test.com" from "Test Company"
    And there are 5 log statements for "Test App1" of "Test Company"
    And there are 5 log statements for "Test App2" of "Test Company"
    When I am on my dashboard page
    And I follow "Test App1"
    Then I should see the 1 set of log statements for the "Test App1" application