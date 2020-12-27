class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).parmit(:name, :explanation, :price, :category_id, :state_id, :charges_id, :prefecture_id, :days_id, :image).merge(user_id: current_user.id)
  end
end
