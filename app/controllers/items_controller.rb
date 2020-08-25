class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :comment, :state_id, :shipping_fee_id, :prefecture_id, :until_shipping_id, :category_id, :price).merge(user_id: current_user.id)
  end
end
