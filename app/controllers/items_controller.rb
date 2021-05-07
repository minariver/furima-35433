class ItemsController < ApplicationController

  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :product_detail, :price, :category_id, :status_id, :postage_id, :prefecture_id, :shipment_id, :image)
  end

end
