require 'spec_helper'

describe 'admin/index.html.erb' do

  before(:each) do
    assign(:runners, [
      stub_model(Runner,
        :name => 'Name',
        :number => 1,
        :time => '9.99',
      ),
    ])
  end

  it "renders a list of runners" do
    render
    rendered.should have_selector('tr>td.name', :content => 'Name'.to_s, :count => 1)
    rendered.should have_selector('tr>td.number', :content => 1.to_s, :count => 1)
    rendered.should have_selector('tr>td.time', :content => '9.99'.to_s, :count => 1)
    rendered.should have_selector('tr>td.delete', :content => 'Delete'.to_s, :count => 1)
    rendered.should have_selector('tr>td.edit', :content => 'Edit'.to_s, :count => 1)
  end

end
