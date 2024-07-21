class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                    :shipping_days_id, :image)
  end
end
