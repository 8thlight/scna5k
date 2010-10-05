require 'spec_helper'

describe "runners/index.html.erb" do
  before(:each) do
    assign(:runners, [
      stub_model(Runner,
        :name => "Name",
        :number => 1,
        :time => "9.99"
      ),
      stub_model(Runner,
        :name => "Name",
        :number => 1,
        :time => "9.99"
      )
    ])
  end

  it "renders a list of runners" do
    render
    rendered.should have_selector("tr>td.name", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td.number", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td.time", :content => "9.99".to_s, :count => 2)
  end
end
