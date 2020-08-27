class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @items = Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to root_path and return
    else
      render :new
    end

    redirect_to action: :done and return
  end

  def done
    @item_buyer = item.find(params[:id])
    @item_buyer.update(buyer_id: current_user.id)
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path and return
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :comment, :state_id, :shipping_fee_id, :prefecture_id, :until_shipping_fee_id, :category_id, :price).merge(user_id: current_user.id)
  end
end
