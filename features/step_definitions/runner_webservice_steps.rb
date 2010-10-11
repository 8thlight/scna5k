Given /^I get runners$/ do
  @runners_xml = visit path_to("runners")
end

Then /^I should have in my response the following runners:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Given /^there are no runners$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I call send with the following runners:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Then /^I should have the following runners$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end


