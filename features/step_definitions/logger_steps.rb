Given /^there is a registered application named "(.*)"$/ do |app_name|
  app_for(app_name)
end

Given /^I should be logged in as "(.*)"$/ do |email|
  controller.current_user.should_not be_nil
  controller.current_user.email.should == email
end

def app_for(app_name)
  Application.find_by_name(app_name) || Factory(:application, :name => app_name)
end

def basic_authenticate(device_id, app_name)
  { "HTTP_AUTHORIZATION" => "Basic " + Base64::encode64("#{device_id}:#{app_for(app_name).token}") }
end