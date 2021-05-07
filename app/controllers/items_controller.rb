class ItemsController < ApplicationController

  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :product_detail, :price, :category_id, :status_id, :postage_id, :prefecture_id, :shipment_id, :image).merge(user_id: current_user.id)
  end

end
