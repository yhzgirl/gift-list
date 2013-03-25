class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:ocassion])
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

end
