class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create
    # if @boat.save
    #   redirect_to @boat
    # else
    #   render :new
    # end
  end

end
