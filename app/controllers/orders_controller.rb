class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id != @item.user_id && @item.buyer.nil?

    else
      redirect_to root_path
    end
  end

  def new
    @buyer = BuyerAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = BuyerAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:price, :token, :postalcoad, :prefecture_id, :city, :house_number, :building, :phone, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
