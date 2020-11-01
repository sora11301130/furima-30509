class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index,:create]
  before_action :order_user
  def index
    @order = Order.new
    @order_destination = OrderDestination.new
    if @order_item.order 
      redirect_to root_path
    end
  end


  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      return redirect_to root_path
    else
      @order_item = Item.find(params[:item_id])

      render action: :index
    end
    
  end

  private


  def order_params
    params.require(:order_destination).permit(:post_code, :prefecture_code_id, :city, :house_number, :build_number, :phone_number,:token).merge(user_id: current_user.id).merge(price: @order_item.price).merge(item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_user
    return redirect_to root_path if current_user.id == @order_item.user_id
  end
 
  def set_order
    @order_item = Item.find(params[:item_id])
  end


end
