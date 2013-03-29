class ListsController < ApplicationController
  
  before_filter :authenticate
  before_filter :authorize, :except => [:new, :create, :index]

  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    @list.user = current_user
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      flash[:notice] = "Your changes have been saved."
      redirect_to list_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.delete
      flash[:notice] = 'Your list has been deleted.'
      redirect_to lists_path
    else
      flash[:notice] = 'You have a problem.  Try again!'
      redirect_to lists_path
    end
  end
end