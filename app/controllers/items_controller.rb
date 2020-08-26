class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  # def show
  #   @item = Item.find(params[:id])
  # end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to root_path
    else
      render :new
    end

    redirect_to action: :done
  end

  def done
    @item_buyer = item.find(params[:id])
    @item_buyer.update(buyer_id: current_user.id)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :comment, :state_id, :shipping_fee_id, :prefecture_id, :until_shipping_id, :category_id, :price).merge(user_id: current_user.id)
  end
end
