Given /^I get runners$/ do
  visit path_to('runners')
  wrapper = Capybara.current_session.driver
  @runners_json = JSON.restore(wrapper.body)
end

Then /^I should have in my response the following runners:$/ do |table|
  runners = @runners_json.map do |runner|
    runner['runner']
  end.each do |runner|
    ['id', 'created_at', 'updated_at'].each do |key|
      runner.delete key
    end
    runner = runner.map do |key, value|
      runner[key] = value.to_s
    end
  end
=begin old xml code
  runners = @runners_xml.map do |runner|
    Hash[*(['name', 'number', 'time'].map do |attr|
      [ attr, runner.xpath('.//'+attr).text ]
    end.flatten)]
  end
=end
  table.diff! runners
end

Given /^there are no runners$/ do
  Runner.delete_all
end

Given /^I call send with the following runners:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending
  #runners = { :runner => { :name => name, :time => '11:22.44', :number => '42' } }
  #rack_test_session_wrapper = Capybara.current_session.driver
  #rack_test_session_wrapper.process :post, upload_runners_path, runners
end

Then /^I should have the following runners$/ do |table|
  # table is a Cucumber::Ast::Table
  Runner.create!(table.hashes)
end
