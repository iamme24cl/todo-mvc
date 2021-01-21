class ListsController < ApplicationController

  def index
    @list = List.new
    @lists = List.all
    # raise @lists.inspect
  end

  def show
    @list = List.find(params[:id])
    @item = @list.items.build
  end

  def create
    # raise params.inspect
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      @lists = List.all
      render :index
    end
  end

  def edit
  end

  def update
  end


  private

  def list_params
    params.require(:list).permit(:name)
  end
end
