class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :redirect_to_index, only: [:edit, :update]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_parameter)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def items_parameter
    params.require(:item).permit(:name, :description, :category_id, :status_id, :fee_id, :prefecture_id, :delivery_date_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def redirect_to_index
    if current_user != Item.find(params[:id]).user
      redirect_to root_path
    end
  end
end
