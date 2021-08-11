class UsersController < ApplicationController
  skip_before_action :require_login, only: %i(new create)

  def index
    @users = User.page(params[:page]).per(10).search(params[:search])
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Register success"
      redirect_to login_path
    else
      flash[:success] = "Register failed"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
  
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash[:success] = "Profile updated failed"
      render 'edit'
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit :name, :password, :password_confirmation
  end
end