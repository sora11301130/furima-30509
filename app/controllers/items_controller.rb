class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  def index
    @items = Item.all.includes(:user).order("created_at DESC")
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
    @message = Message.new
    @messages = @item.messages.includes(:user).order("created_at DESC")
  end

  def edit
    if current_user.id !=@item.user_id
      redirect_to root_path
    end
    
  end

  def update
     if @item.update(item_params)
      redirect_to item_path(@item)
     else
      render :edit
     end
  end

  def destroy
    if current_user.id = @item.user_id
      if @item.destroy
        redirect_to root_path
      end
    end

  end



  private

  def item_params
    params.require(:item).permit(:title, :status_id, :category_id, :plan_id, :cost_id, :prefecture_code_id, :price, :description, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
