require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  context 'バリデーションのテスト' do
    it '商品名が必須であること' do
      @product.name = ''
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it '価格が必須であること' do
      @product.price = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include('Price is not a number')
    end

    it '価格が必須であること' do
      @product.price = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
  end
end
