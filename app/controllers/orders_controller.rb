class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    if order_id = nil
      redirect_to root_path
    end
    @order_item = Item.find(params[:item_id])
    if current_user.id !=@order_item.user_id
    @order = Order.new
    @order_destination = OrderDestination.new
    else
      return root_path
    end
  end


  def create
    @order_item = Item.find(params[:item_id])
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
    params.require(:order_destination).permit(:post_code, :prefecture_code_id, :city, :house_number, :build_number, :phone_number, :item_id, :token).merge(user_id: current_user.id, price: @order_item.price, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end


end
