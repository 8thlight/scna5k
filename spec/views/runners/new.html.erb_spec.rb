require 'spec_helper'

describe "runners/new.html.erb" do
  before(:each) do
    assign(:runner, stub_model(Runner,
      :new_record? => true,
      :name => "MyString",
      :number => 1,
      :time => "9.99"
    ))
  end

  it "renders new runner form" do
    render

    rendered.should have_selector("form", :action => runners_path, :method => "post") do |form|
      form.should have_selector("input#runner_name", :name => "runner[name]")
      form.should have_selector("input#runner_number", :name => "runner[number]")
      form.should have_selector("input#runner_time", :name => "runner[time]")
    end
  end
end
