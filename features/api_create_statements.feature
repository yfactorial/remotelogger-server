Feature: Statement logging
  In order to remote log
  As an application
  I need to be able to create log statements
    
  Scenario: Send statement to the XML API
    Given there is a registered application named "Harvest"
    When I submit a "info" log statement of "this is my message" from the "Harvest" application on device "1" as XML
    Then "Harvest" should have a "INFO" log statement of "this is my message" recorded for device "1"
    
  Scenario: Send statement to the JSON API
    Given there is a registered application named "Harvest"
    When I submit a "info" log statement of "this is my message" from the "Harvest" application on device "1" as JSON
    Then "Harvest" should have a "INFO" log statement of "this is my message" recorded for device "1"