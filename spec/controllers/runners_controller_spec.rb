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

  it "inputs a single time, given a time and runner number" do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64(Admin.first.username + ":" + Admin.first.password)
    runner = Runner.create(:name => "Harriet Tubman")

    post :input_times_submit, :runner => {:number => runner.number, :minutes => 12, :seconds => 2.33}

    runner.reload
    runner.minutes.should == 12
    runner.seconds.should == 2.33
    response.should redirect_to "/input_times"
    flash[:success].should == "Runner ##{runner.number}'s time updated."
  end

  it "handles errors when an invalid runner number is input" do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64(Admin.first.username + ":" + Admin.first.password)

    post :input_times_submit, :runner => {:number => 1, :minutes => 12, :seconds => 2.33}

    flash[:failure].should == "Invalid runner number."
    response.should redirect_to "/input_times"
  end

end
