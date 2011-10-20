require 'spec_helper'

describe RunnersController do

  before(:all) do
    Admin.destroy_all
    Admin.create(:username => "Randy", :password => "Savage")
  end

  it "gets the index page" do
    get :index
    response.should be_success
  end

  it "creates a runner" do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64(Admin.first.username + ":" + Admin.first.password)
    post :create, :runners => {:names => "Randy Savage\nHulk Hogan"}
    response.should redirect_to :root
  end

  it "updates multiple records simutaneously" do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64(Admin.first.username + ":" + Admin.first.password)
    runner1 = Runner.create(:name => "Cheech")
    runner2 = Runner.create(:name => "Chong")

    post :update_times, :runner => {runner1.id => {:minutes => "12", :seconds => "48.73"}, runner2.id => {:minutes => "1", :seconds => "2.01"}}
    runner1.reload
    runner2.reload

    runner1.minutes.should == 12
    runner1.seconds.should == 48.73
    runner2.minutes.should == 1
    runner2.seconds.should == 2.01
  end

end
