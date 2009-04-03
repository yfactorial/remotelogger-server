Given /^there should be a registered application "(.*)" for "(.*)"$/ do |app_name, account_name|
  account = Account.find_by_name(account_name)
  account.should_not be_nil
  account.applications.find_by_name(app_name).should_not be_nil
end

Then /^I should now be on the app setup page for "(.*)"$/ do |app_name|
  URI.parse(current_url).path.should == setup_my_application_path(app_for(app_name))
end

Then /^I should see the application token for "(.*)"$/ do |app_name|
  Then "I should see \"#{Application.find_by_name(app_name).token}\""
end