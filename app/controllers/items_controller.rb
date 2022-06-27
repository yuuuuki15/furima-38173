class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @user = User.new
  end

  def create(items_parameter)
    
  end

  private
  def items_parameter
    params.require(:item).permit(:name, :description, :category_id, :status_id, :fee_id, :prefecture_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
