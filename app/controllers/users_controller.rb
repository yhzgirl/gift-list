class UsersController < ApplicationController

  
  before_filter :authenticate, :except => [:create, :new]
  before_filter :authorize, :except => [:create, :new]
  before_filter :require_admin, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
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

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your information has been updated"
      redirect_to @user
    else
      render :update
    end
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
