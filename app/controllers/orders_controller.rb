class OrdersController < ApplicationController
  def index
  end

  def new
    @order = OrderManagements.new
  end
end
