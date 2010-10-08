class AdminController < ApplicationController

  def index
    redirect_to root_url unless logged_in
  end

  def login
    session[:username] = params[:username]
    session[:password] = Digest::SHA1.hexdigest(params[:password])

    if logged_in then
      redirect_to admin_index_url
    else
      redirect_to root_url, :notice => 'Login failed'
    end
  end

end
