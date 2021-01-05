class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @item = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
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
    if current_user.id == @item.user.id
      if @item.save
        @item.update(item_params)
        redirect_to item_path(@item)
      else
        render :edit
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :state_id, :charges_id, :prefecture_id, :days_id,
                                 :image).merge(user_id: current_user.id)
  end
end
