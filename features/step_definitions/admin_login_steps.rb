Given /^the following users:$/ do |table|
  # table is a Cucumber::Ast::Table

  users = table.hashes

  users.each do |user|
    user[:password] = Digest::SHA1.hexdigest(user[:password])
  end

  Admin.create!(users)
end

When /^I fill in the following$/ do |table|
  # table is a Cucumber::Ast::Table

  within('#loginform') do
    table.raw.each do |field, value|
      fill_in field, :with => value
    end
  end
end

Given /^There are no users$/ do
  Admin.delete_all
end
