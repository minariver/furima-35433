class ItemsController < ApplicationController

  def index
    
  end

  def new
    @item = Item.new
    @prefectures = Prefecture.order("created_at DESC")
    @prefecture = Prefecture.new
  end

  def create
    Item.create(item_params)
    @Prefecture = Prefecture.new(prefecture_params)
    if @prefecture.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :product_detail, :price, :category_id, :status_id, :postage_id, :prefecture_id, :shipment_id, :image)
  end

  def prefecture_params
    params.require(:prefecture).permit(:prefecture_id)
  end

end
