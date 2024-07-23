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
      expect(@product.errors.full_messages).to include("Price is not a number") # rubocop:disable Style/StringLiterals
    end

    it '価格が数値であること' do
      @product.price = 'abc'
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price is not a number") # rubocop:disable Style/StringLiterals
    end

    it '価格が300以上であること' do
      @product.price = 299
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300") # rubocop:disable Style/StringLiterals
    end

    it '価格が9999999以下であること' do
      @product.price = 10_000_000
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999") # rubocop:disable Style/StringLiterals
    end
  end
end
