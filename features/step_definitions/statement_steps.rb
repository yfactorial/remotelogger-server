#-- API --

Given /^I submit a "(.*)" log statement of "(.*)" from the "(.*)" application on device "(.*)" as XML$/ do |level, message, app_name, device_id|
  post '/api/v1/statements.xml', { :statement => { :level => level, :message => message } }, basic_authenticate(device_id, app_name)
end

Given /^I submit a "(.*)" log statement of "(.*)" from the "(.*)" application on device "(.*)" as JSON$/ do |level, message, app_name, device_id|
  post '/api/v1/statements.json', { :statement => { :level => level, :message => message } }, basic_authenticate(device_id, app_name)
end

#-- App --

Given /^there are (\d+) log statements for "(.*)" of "(.*)"$/ do |num, app_name, account_name|
  num.to_i.times do
    Factory(:statement, :application => app_for(app_name, account_name))
  end
end

Given /^there are (\d+) log statements on device "(.*)" for "(.*)" of "(.*)"$/ do |num, device_id, app_name, account_name|
  num.to_i.times do
    Factory(:statement, :device_id => device_id, :application => app_for(app_name, account_name))
  end
end

Given /^I visit the application statements page for "(.*)"$/ do |app_name|
  visit my_application_path(app_for(app_name))
end

#-- Common --

Then /^I should see the (\d+) set of log statements for the "(.*)" account$/ do |page, account_name|
  account_for(account_name).statements.paginate(:page => page.to_i).each do |statement|
    [:level, :message].each do |attr|
      Then "I should see \"#{statement.send(attr)}\""
    end
  end
end

Then /^I should see the (\d+) set of log statements for the "(.*)" application$/ do |page, app_name|
  app_for(app_name).statements.paginate(:page => page.to_i).each do |statement|
    [:level, :message].each do |attr|
      Then "I should see \"#{statement.send(attr)}\""
    end
  end
end

Then /^I should see the (\d+) set of log statements on device "(.*)" for the "(.*)" application$/ do |page, device_id, app_name|
  app_for(app_name).statements.on(device_id).paginate(:page => page.to_i).each do |statement|
    [:level, :message].each do |attr|
      Then "I should see \"#{statement.send(attr)}\""
    end
  end
end

Then /^"(.*)" should have a "(.*)" log statement of "(.*)" recorded for device "(.*)"$/ do |app_name, level, message, device_id|
  statement = app_for(app_name).statements.find(:first, :conditions => {:level => level.upcase, :message => message, :device_id => device_id})
  statement.should_not be_nil
end