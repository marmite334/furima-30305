class OrdersController < ApplicationController
  def index
    @order_management = OrderManagement.new
    @item = Item.find(params[:item_id])
  end
  def create
    binding.pry
  end
end
