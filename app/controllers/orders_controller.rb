class OrdersController < ApplicationController
  def index
    @order_management = OrderManagement.new
  end
end
