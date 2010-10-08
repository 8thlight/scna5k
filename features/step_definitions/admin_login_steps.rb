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
