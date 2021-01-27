class ListsController < ApplicationController
  before_action :login_required

  def index
    # if you're not logged in, you can't see this, in fact, go back to the log in page
    @list = List.new
    @lists = List.all
    # raise @lists.inspect
  end

  def show
    # raise params.inspect
    @list = List.find(params[:id])
    @item = Item.new
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

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path
  end


  private

  def list_params
    params.require(:list).permit(:name)
  end
end
