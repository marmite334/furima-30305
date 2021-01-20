class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_item_id

  def index
    @order_management = OrderManagement.new
  end

  def create
    @order_management = OrderManagement.new(order_params)
    if @order_management.valid?
      pay_item
      @order_management.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_management).permit(
      :postal_code, :prefecture_id,
      :municipalities, :address, :building, :phone_number,
      :purchase_management_id
    ).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def get_item_id
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
