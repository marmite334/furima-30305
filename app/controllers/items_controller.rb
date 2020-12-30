class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: [:new, :create]
  

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :state_id, :charges_id, :prefecture_id, :days_id,
                                 :image).merge(user_id: current_user.id)
  end
end
