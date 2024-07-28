class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update]
  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
    return unless current_user.id != @item.user.id || @item.sold_out

    redirect_to root_path
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params_with_image)
      redirect_to item_path(@item), notice: '商品情報が更新されました'
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_fee_status_id,
                                 :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def item_params_with_image
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_status_id,
                                 :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id).tap do |item_params|
      item_params.delete(:image) if item_params[:image].blank?
    end
  end
end
