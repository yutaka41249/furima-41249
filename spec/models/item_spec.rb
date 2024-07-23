require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = Item.new(
      name: 'Sample Item',
      description: 'This is a sample item.',
      price: 1000,
      category_id: 1,
      condition_id: 1,
      shipping_fee_status_id: 1,
      prefecture_id: 1,
      scheduled_delivery_id: 1
    )
  end

  context 'バリデーションのテスト' do
    it 'すべての属性が有効である場合、アイテムは有効である' do
      expect(@item).to be_valid
    end

    it '名前がなければ無効である' do
      @item.name = ''
      expect(@item).not_to be_valid
    end

    it '説明がなければ無効である' do
      @item.description = ''
      expect(@item).not_to be_valid
    end

    it '価格が正の整数でなければ無効である' do
      @item.price = -100
      expect(@item).not_to be_valid

      @item.price = 'abc'
      expect(@item).not_to be_valid

      @item.price = 0
      expect(@item).not_to be_valid
    end

    it 'カテゴリーがなければ無効である' do
      @item.category_id = nil
      expect(@item).not_to be_valid
    end

    it '状態がなければ無効である' do
      @item.condition_id = nil
      expect(@item).not_to be_valid
    end

    it '送料負担がなければ無効である' do
      @item.shipping_fee_status_id = nil
      expect(@item).not_to be_valid
    end

    it '都道府県がなければ無効である' do
      @item.prefecture_id = nil
      expect(@item).not_to be_valid
    end

    it '配送予定がなければ無効である' do
      @item.scheduled_delivery_id = nil
      expect(@item).not_to be_valid
    end
  end
end
