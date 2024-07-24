require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end

  context '正常系: すべての値が正しく設定されている場合' do
    it 'アイテムは有効である' do
      expect(@item).to be_valid
    end
  end

  context '異常系: バリデーションエラーが発生する条件' do
    it '名前がなければ無効である' do
      @item.name = ''
      @item.valid
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '説明がなければ無効である' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it '価格が正の整数でなければ無効である' do
      @item.price = -100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')

      @item.price = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')

      @item.price = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'カテゴリーがなければ無効である' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '状態がなければ無効である' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '送料負担がなければ無効である' do
      @item.shipping_fee_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
    end

    it '都道府県がなければ無効である' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '配送予定がなければ無効である' do
      @item.scheduled_delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
    end
  end
end
