class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by name: params[:session][:name]
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Login success"
      log_in user
      redirect_to users_path
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = "You are logged out"
    redirect_to login_path
  end
end
