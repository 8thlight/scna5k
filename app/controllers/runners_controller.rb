class RunnersController < ApplicationController

  before_filter :authenticate

  def index
    @runners = Runner.all
  end

  def new
    @runner = Runner.new
  end

  def create
    runner_names = params[:runners][:names]
    runners = Runner.create_runners_from_string(runner_names)
    redirect_to :root
  end

  def update_times
    Runner.update(params[:runner].keys, params[:runner].values)
    redirect_to :root
  end

  def edit_times
    @runners = Runner.all
    render "edit_times"
  end

  private

  def authenticate
    ActionController::Base::http_basic_authenticate_with :name => Admin.first.username, :password => Admin.first.password, :only => [:create, :new, :update_times, :edit_times]
  end


end
