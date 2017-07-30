class SessionsController < ApplicationController
  def new
  end
  def create
  	 user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
       params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = "Inregistered Email"
      render 'new'
    end
  end
   def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
