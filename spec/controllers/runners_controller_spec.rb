require 'spec_helper'

describe RunnersController do

  def mock_runner(stubs={})
    @mock_runner ||= mock_model(Runner, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all runners as @runners" do
      Runner.stub(:find).with(:all, :order => 'time asc') { [mock_runner] }
      get :index
      assigns(:runners).should eq([mock_runner])
    end
  end

  describe "GET new" do
    it "should redirect to index if no authentication" do
      Admin.stub(:where) { [] }
      get :new
      response.should redirect_to(root_url)
    end
    it "assigns a new runner as @runner" do
      Runner.stub(:new) { mock_runner }
      get :new
      assigns(:runner).should be(mock_runner)
    end
  end

  describe "GET edit" do
    it "should redirect to index if no authentication" do
      Runner.stub(:find).with("2") { mock_runner }
      get :edit, :id => "2"
      response.should redirect_to(root_url)
    end

    it "assigns the requested runner as @runner" do
      Runner.stub(:find).with("37") { mock_runner }
      get :edit, :id => "37"
      assigns(:runner).should be(mock_runner)
    end
  end

  describe "POST create" do

    describe "without authentication" do

      it "should not create a new runner object" do
        session = {}
        Admin.stub(:where) { [] }
        Runner.should_not_receive :new
        post :create, :runner => {}
      end

      it "should redirect to root url" do
        session = {}
        Admin.stub(:where) { [] }
        post :create, :runner => {}
        response.should redirect_to(root_url)
      end

    end

    describe "with authentication" do

      describe "with valid params" do
        it "assigns a newly created runner as @runner" do
          Admin.stub(:where) { [ 42 ] }
          Runner.stub(:new).with({'these' => 'params'}) { mock_runner(:save => true) }
          post :create, :runner => {'these' => 'params'}
          assigns(:runner).should be(mock_runner)
        end

        it "redirects to the admin page" do
          Admin.stub(:where) { [ 42 ] }
          Runner.stub(:new) { mock_runner(:save => true) }
          post :create, :runner => {}
          response.should redirect_to(admin_index_url)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved runner as @runner" do
          Admin.stub(:where) { [ 42 ] }
          Runner.stub(:new).with({'these' => 'params'}) { mock_runner(:save => false) }
          post :create, :runner => {'these' => 'params'}
          assigns(:runner).should be(mock_runner)
        end

        it "re-renders the 'new' template" do
          Admin.stub(:where) { [ 42 ] }
          Runner.stub(:new) { mock_runner(:save => false) }
          post :create, :runner => {}
          response.should render_template("new")
        end
      end

    end

  end

  describe "PUT update" do

    describe "with authentication" do

      describe "with valid params" do
        it "updates the requested runner" do
          Admin.stub(:where) { [ 42 ] }
          Runner.should_receive(:find).with("37") { mock_runner }
          mock_runner.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :runner => {'these' => 'params'}
        end

        it "assigns the requested runner as @runner" do
          Admin.stub(:where) { [ 42 ] }
          Runner.stub(:find) { mock_runner(:update_attributes => true) }
          put :update, :id => "1"
          assigns(:runner).should be(mock_runner)
        end

        it "redirects to the admin page" do
          Admin.stub(:where) { [ 42 ] }
          Runner.stub(:find) { mock_runner(:update_attributes => true) }
          put :update, :id => "1"
          response.should redirect_to(admin_index_url)
        end
      end

      describe "with invalid params" do
        it "assigns the runner as @runner" do
          Admin.stub(:where) { [ 42 ] }
          Runner.stub(:find) { mock_runner(:update_attributes => false) }
          put :update, :id => "1"
          assigns(:runner).should be(mock_runner)
        end

        it "re-renders the 'edit' template" do
          Admin.stub(:where) { [ 42 ] }
          Runner.stub(:find) { mock_runner(:update_attributes => false) }
          put :update, :id => "1"
          response.should render_template("edit")
        end
      end

    end

    describe "without authentiction" do

      before(:each) do
        Admin.stub(:where) { [] }
        Runner.stub(:find) { mock_runner }
      end

      it "should not update the requested runner" do
        mock_runner.should_not_receive :update_attributes
        put :update, :id => "1", :runner => {'these' => 'params'}
      end

      it "should redirect to the home page" do
        put :update, :id => "1"
        response.should redirect_to(root_url)
      end

    end

  end

  describe "DELETE destroy" do

    describe "with authentication" do
      it "destroys the requested runner" do
        Admin.stub(:where) { [ 42 ] }
        Runner.should_receive(:find).with("37") { mock_runner }
        mock_runner.should_receive(:destroy)
        delete :destroy, :id => "37"
      end

      it "redirects to the runners list" do
        Admin.stub(:where) { [ 42 ] }
        Runner.stub(:find) { mock_runner }
        delete :destroy, :id => "1"
        response.should redirect_to(admin_index_url)
      end
    end

    describe "without authentication" do
      before(:each) do
        Admin.stub(:where) { [] }
        Runner.stub(:find) { mock_runner }
      end

      it "should not destroy the requested runner" do
        delete :destroy, :id => "1"
        mock_runner.should_not_receive :destroy
      end

      it "should redirect to the home page" do
        delete :destroy, :id => "1"
        response.should redirect_to(root_url)
      end
    end

  end

end
