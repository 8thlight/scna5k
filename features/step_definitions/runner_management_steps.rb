Given /^I am logged in$/ do
  Admin.create({:username => 'eric', :password => Digest::SHA1.hexdigest('smith')})

  visit root_path
  within('#loginform') do
    fill_in 'username', :with => 'eric'
    fill_in 'password', :with => 'smith'
  end
  click_button 'Login'
end

When /^I delete the (\d+)nd runner$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I edit the (\d+)st runner$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
