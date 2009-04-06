Given /^I visit the "(.*)" device page for "(.*)"$/ do |app_name, device_id|
  visit my_application_device_statements_path(app_for(app_name), device_id)
end