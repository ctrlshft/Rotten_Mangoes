class Admin::UsersController < ApplicationController

  before_action :require_user, only: [:show, :edit, :update, :destroy]

  def index
    # @users = User.all
    @users = User.order("id").page(params[:page]).per(5)
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
    unless @current_user == @user
    @user.destroy
    redirect_to admin_users_path
  end
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

  def require_user
    @user = User.find(params[:id])
  end


  
end
