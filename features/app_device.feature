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
    
  Scenario: Label a device
    Given I am logged in as "ryan@test.com" from "Test Company"
    And there are 5 log statements on device "device1" for "Test App1" of "Test Company"
    And I visit the "Test App1" device page for "device1"
    And I fill in "Label Device" with "Ryan's device"
    And I press "label"
    Then I should see "as Ryan's device"
    And I should see "Recent Activity in Test App1 on Ryan's device"
    
  Scenario: Remove device label
    Given I am logged in as "ryan@test.com" from "Test Company"
    And there are 5 log statements on device "device1" for "Test App1" of "Test Company"
    And I visit the "Test App1" device page for "device1"
    And I fill in "Label Device" with "Ryan's device"
    And I press "label"
    And I should see "Ryan's device"
    When I follow "Remove Device Label"
    Then I should see "Removed label for device"
    And I should not see "Ryan's device"