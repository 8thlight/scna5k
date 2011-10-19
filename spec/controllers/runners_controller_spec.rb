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

end
