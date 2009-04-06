Feature: Device statements
  In order to view a summary of the activity on a device
  I need to be able to view the device statements
    
  Scenario: View application statements
    Given I am logged in as "ryan@test.com" from "Test Company"
    And there are 5 log statements on device "device1" for "Test App1" of "Test Company"
    And there are 5 log statements on device "device1" for "Test App2" of "Test Company"
    When I am on my dashboard page
    And I follow "Test App1"
    And I follow "device1"
    Then I should see the 1 set of log statements on device "device1" for the "Test App1" application