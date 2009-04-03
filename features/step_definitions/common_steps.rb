Given /^there is a registered application named "(.*)"$/ do |app_name|
  app_for(app_name)
end

Given /^"(.*)" is a registered user with password "(.*)"$/ do |email, password|
  Factory(:user, :email => email, :password => password)
end

Given /^I login as "(.*)" with password "(.*)"$/ do |email, password|
  Given "I am on the login page"
  Given "I fill in \"Email\" with \"#{email}\""
  Given "I fill in \"Password\" with \"#{password}\""
  Given "I press \"Login\""
end

Given /^I am logged in as "(.*)" from "(.*)"$/ do |email, account_name|
  user = Factory(:user, :email => email, :account => Factory(:account, :name => account_name))
  Given "I login as \"#{email}\" with password \"#{user.password}\""
end

Then /^I should be logged in as "(.*)"$/ do |email|
  controller.current_user.should_not be_nil
  controller.current_user.email.should == email
end

def app_for(app_name, account_name = nil)
  if account_name
    account = account_for(account_name)
    account.applications.find_by_name(app_name) || Factory(:application, :name => app_name, :account => account)
  else
    Application.find_by_name(app_name) || Factory(:application, :name => app_name)
  end
end

def account_for(account_name)
  Account.find_by_name(account_name) || Factory(:account, :name => account_name)
end

def basic_authenticate(device_id, app_name)
  { "HTTP_AUTHORIZATION" => "Basic " + Base64::encode64("#{device_id}:#{app_for(app_name).token}") }
end