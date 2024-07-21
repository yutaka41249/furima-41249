require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  it '商品名が必須であること' do
    @product.name = ''
    @product.valid?
    expect(@product.errors.full_messages).to include("Name can't be blank")
  end

  it '価格が必須であること' do
    @product.price = ''
    @product.valid?
    expect(@product.errors.full_messages).to include("Price can't be blank")
  end

  # 他のテストも同様に追加します
end
