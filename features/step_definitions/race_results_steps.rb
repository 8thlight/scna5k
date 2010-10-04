Given /^there are (\d+) runners:$/ do |arg1, table|
  # table is a Cucumber::Ast::Table
#  pending # express the regexp above with the code you wish you had
end

Then /^I should see the following runners:$/ do |table|
  true.should be_false
  # table is a Cucumber::Ast::Table
#  pending # express the regexp above with the code you wish you had
end
