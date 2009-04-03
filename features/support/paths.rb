module NavigationHelpers
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      root_path
    when /the login page/
      login_path
    when /the register page/
      register_path
    when /new application page/
      new_my_application_path
    when /the my dashboard page/
      new_my_application_path
    when /the edit account page/
      edit_my_account_path
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in features/support/paths.rb"
    end
  end
end

World do |world|
  world.extend NavigationHelpers
  world
end
