class AdminController < ApplicationController

  def index
    redirect_to root_url unless session[:logged_in]
  end

  def login
    exists = Admin.where(:username => params[:username], :password => params[:password]).count > 0
    session[:logged_in] = true if exists
    if exists then
      redirect_to admin_index_url
    else
      redirect_to root_url, :notice => 'Login failed'
    end
  end

end
