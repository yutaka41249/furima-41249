class PurchasesController < ApplicationController
  before_action :set_item
  def new
  end

  def create
    if @item.update(purchase_params)
      redirect_to item_path(@item), notice: '購入が完了しました'
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    # 購入に必要なパラメータを許可します
    params.require(:purchase).permit(:user_id, :item_id)
  end
end
