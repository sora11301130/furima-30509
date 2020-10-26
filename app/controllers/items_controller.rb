class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if current_user.id !=@item.user_id
      redirect_to root_path
    end

    if current_user.id !=user_signed_in?
      return new_user_session_path
    end
    
  end

  def update
     @item = Item.find(params[:id])
     if @item.update(item_params)
      redirect_to item_path(@item)
     else
      render :edit
     end
  end


  private

  def item_params
    params.require(:item).permit(:title, :status_id, :category_id, :plan_id, :cost_id, :prefecture_code_id, :price, :description, :image).merge(user_id: current_user.id)
  end
end
