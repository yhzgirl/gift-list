class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete
      flash[:notice] = "User has been deleted."
      redirect_to users_path
    else
      flash[:notice] = "You have a problem. User not deleted."
      redirect_to users_path
    end
  end
end
