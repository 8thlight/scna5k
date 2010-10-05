Given /^there are (\d+) runners:$/ do |quantity, table|
  # table is a Cucumber::Ast::Table

  quantity.times do |i|
    name, number, time = table.raw[i]
  end
end

Then /^I should see the following runners:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end
