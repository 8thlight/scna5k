class RunnersController < ApplicationController

  before_filter :authenticate

  def index
    @runners_with_times = Runner.where("minutes IS NOT NULL AND seconds IS NOT NULL")
    @runners_without_times = Runner.where("minutes IS NULL OR seconds IS NULL")
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

  def input_times
    render "input_times_form"
  end

  def input_times_submit
    runner = Runner.find_by_number(params[:runner][:number])
    runner.update_attributes(:minutes => params[:runner][:minutes], :seconds => params[:runner][:seconds])
    flash[:result] = "Runner ##{runner.number}'s time updated."
    redirect_to "/input_times"
  end

  private

  def authenticate
    ActionController::Base::http_basic_authenticate_with :name => Admin.first.username, :password => Admin.first.password, :only => [:create, :new, :update_times, :edit_times, :input_times, :input_times_submit]
  end


end
