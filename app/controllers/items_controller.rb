class ItemsController < ApplicationController

  def index
    @list = List.find_by(id: params[:list_id])
    @item = Item.new
    redirect_to list_path(@list)
  end

  def create
    # raise params.inspect
    @list = List.find_by(id: params[:list_id])
    @item = @list.items.build(item_params)
    if @item.save
      redirect_to list_path(@list)
    else
      @list = List.find_by(id: params[:list_id])
      render 'lists/show'
    end
  end

  # PATCH - /lists/:list_id/items/:id
  def update
    # raise params.inspect
    @item = Item.find(params[:id])
    @item.update(item_params)

    redirect_to list_path(@item.list)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to list_path(@item.list)
  end

  private

  def item_params
    params.require(:item).permit(:description, :status)
  end

end
