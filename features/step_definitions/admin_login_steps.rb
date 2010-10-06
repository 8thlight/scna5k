Given /^the following users:$/ do |table|
  # table is a Cucumber::Ast::Table

  Admin.create!(table.hashes)
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
