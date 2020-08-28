class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy, :done, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
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
    @item.update(buyer_id: current_user.id)
  end

  def destroy
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

  def set_item
    @item = Item.find(params[:id])
  end
end
