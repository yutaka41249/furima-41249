class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @categories = Category.all # すべてのカテゴリを取得
    @conditions = Condition.all
    @shipping_fee_statuses = ShippingFeeStatus.all
    @prefectures = Prefecture.all
    @scheduled_deliveries = ScheduledDelivery.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id,
                                 :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price)
  end
end
