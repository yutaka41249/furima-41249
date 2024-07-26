class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.includes(:user).order(created_at: :desc) # 商品情報を全て取得し、作成日時の新しい順に並び替える
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

  def show
  end

  # def edit
  # end

  # def update
  #   if @item.update(item_params)
  #     redirect_to @item, notice: '商品情報が更新されました。'
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @item.destroy
  #   redirect_to root_path, notice: '商品が削除されました。'
  # end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_fee_status_id,
                                 :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end
