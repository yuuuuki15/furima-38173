class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
  before_action :redirect_to_index, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_parameter)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(items_parameter)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def items_parameter
    params.require(:item).permit(:name, :description, :category_id, :status_id, :fee_id, :prefecture_id, :delivery_date_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def redirect_to_index
    redirect_to root_path if current_user != Item.find(params[:id]).user
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
