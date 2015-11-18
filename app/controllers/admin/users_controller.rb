class Admin::UsersController < ApplicationController

  before_action :require_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
   
  end

  def new
    @user = User.new
  end

  def edit
    
  end

  def create
    @user = User.new(user_params)

    if @user.save
       redirect_to admin_users_path, notice: "#{@user.firstname} was submitted successfully!"
    else
      render :new
    end
  end

  def update


    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

  def require_user
    @user = User.find(params[:id])
  end


  
end
