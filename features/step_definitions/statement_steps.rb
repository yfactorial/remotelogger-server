Given /^I submit a "(.*)" log statement of "(.*)" from the "(.*)" application on device "(.*)" as XML$/ do |level, message, app_name, device_id|
  post '/api/v1/statements.xml', { :statement => { :level => level, :message => message } }, basic_authenticate(device_id, app_name)
end

Given /^I submit a "(.*)" log statement of "(.*)" from the "(.*)" application on device "(.*)" as JSON$/ do |level, message, app_name, device_id|
  post '/api/v1/statements.json', { :statement => { :level => level, :message => message } }, basic_authenticate(device_id, app_name)
end

Then /^"(.*)" should have a "(.*)" log statement of "(.*)" recorded for device "(.*)"$/ do |app_name, level, message, device_id|
  statement = app_for(app_name).statements.find(:first, :conditions => {:level => level.upcase, :message => message, :device_id => device_id})
  statement.should_not be_nil
end