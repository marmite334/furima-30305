class OrdersController < ApplicationController
  def index
    @order_management = OrderManagement.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_management = OrderManagement.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_management.valid?
      @order_management.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:item_id, :user_id, :postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :purchase_management_id)
  end
end
