class OrdersController < ApplicationController
before_action :authenticate_user!, only: [:index, :create]
before_action :redirect_to_root, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      # pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_to_root
    redirect_to root_path if current_user == Item.find(params[:item_id]).user
  end
end
