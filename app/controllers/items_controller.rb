class ItemsController < ApplicationController
  def index
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to user_session_path
    end
  end

  def create
    if user_signed_in?
      Item.create(item_params)
      if @item.save
        redirect_to action: :index
      else
        render :new
      end
    end
  end

  private
  def item_params
    params.require(:item).parmit(:name, :explanation, :price, :category_id, :state_id, :charges_id, :prefecture_id, :days_id, :image).merge(user_id: current_user.id)
  end
end
