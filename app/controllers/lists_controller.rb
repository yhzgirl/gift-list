class ListsController < ApplicationController
  
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    raise ActiveRecord::RecordNotFound if @list.nil?
  end

  def edit
    @list = List.find(params[:id])
  end
end