require 'spec_helper'

describe "runners/show.html.erb" do
  before(:each) do
    @runner = assign(:runner, stub_model(Runner,
      :name => "Name",
      :number => 1,
      :time => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("9.99".to_s)
  end
end
