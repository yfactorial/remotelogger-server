Feature: User dashboard
  In order to view a summary of my account activity
  I need to be able to view the dashboard
    
  Scenario: View user dashboard
    Given I am logged in as "ryan@test.com" from "Test Company"
    And there are 10 log statements for "Test App1" of "Test Company"
    And there are 10 log statements for "Test App2" of "Test Company"
    And there are 10 log statements for "Test App1" of "Test Company"
    And there are 10 log statements for "Test App2" of "Test Company"
    When I am on my dashboard page 
    Then I should see the 1 set of log statements for the "Test Company" account
    And I follow "Next"
    And I should see the 2 set of log statements for the "Test Company" account