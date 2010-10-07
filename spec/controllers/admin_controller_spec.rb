require 'spec_helper'

describe AdminController do

  def mock_admin(stubs={})
    @mock_admin ||= mock_model(Admin, stubs).as_null_object
  end

  describe "GET index" do
    it "redirects to home page when no admins exist" do
      get :index
      response.should redirect_to('/')
    end
    it "does not redirect to home page when any admins exist" do
      session[:logged_in] = true
      get :index
      response.status.should == 200
    end
  end

  describe "POST login" do

    before(:each) do
      Admin.stub(:where) { [] }
      Admin.stub(:where).with(:username => 'eric', :password => 'smith') { [mock_admin] }
    end

    describe "with valid params" do

      it "redirects to admin index" do
        post :login, :username => 'eric', :password => 'smith'
        response.should redirect_to(admin_index_url)
      end

    end

    describe "with invalid params" do

      it "redirects to the home page" do
        post :login, :username => 'steven', :password => 'degutis'
        response.should redirect_to(root_url)
      end

      it "shows a notice on the next screen" do
        post :login, :username => 'steven', :password => 'degutis'
        flash[:notice].should == 'Login failed'
      end

    end

  end

end
