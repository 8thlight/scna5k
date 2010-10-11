class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize

  protected

  def authorize
    redirect_to root_url unless logged_in
  end

  private

  def all_runners
    Runner.find(:all, :order => 'time asc')
  end

  def logged_in
    Admin.where(:username => session[:username], :password => session[:password]).count > 0
  end

end
