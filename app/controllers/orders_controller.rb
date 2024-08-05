class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :check_seller, only: [:index, :create]
  before_action :check_order_status, only: [:index, :create]

  def index
    @order = DonationAddress.new
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def create
    @order = DonationAddress.new(order_params)

    if @order.valid?
      pay_item
      @order.save
      @item.mark_as_sold_out
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:donation_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_seller
    return unless @item.user_id == current_user.id

    redirect_to root_path
  end

  def check_order_status
    nil unless @item.

               redirect_to root_path
  end
end
