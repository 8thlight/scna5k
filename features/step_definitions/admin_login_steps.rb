Given /^the following users:$/ do |table|
  # table is a Cucumber::Ast::Table

  users = table.hashes

  users.each do |user|
    user[:password] = Digest::SHA1.hexdigest(user[:password])
  end

  Admin.create!(users)
end

Given /^There are no users$/ do
  Admin.delete_all
end

When /^I try to edit runner with id (\d+)$/ do |id|
  visit edit_runner_path(id)
end

When /^I try to update runner with id (\d+) to have the name "([^"]*)"$/ do |id, name|
  rack_test_session_wrapper = Capybara.current_session.driver
  rack_test_session_wrapper.process :put, runner_path(id), { :runner => { :name => name, :time => '11:22.44', :number => '42' } }
end

When /^I try to delete runner with id (\d+)$/ do |id|
  rack_test_session_wrapper = Capybara.current_session.driver
  rack_test_session_wrapper.process :delete, runner_path(id)
end

When /^I try to create a new runner$/ do
  rack_test_session_wrapper = Capybara.current_session.driver
  rack_test_session_wrapper.process :post, runners_path
end
