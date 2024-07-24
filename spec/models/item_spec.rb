require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '正常系: すべての値が正しく設定されている場合' do
    it 'アイテムは有効である' do
      expect(@item).to be_valid
    end
  end

  context '異常系: バリデーションエラーが発生する条件' do
    it '名前がなければ無効である' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '説明がなければ無効である' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it '価格が300円未満では出品できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid')
    end

    it '価格に半角数字以外が含まれている場合は出品できない（※半角数字以外が一文字でも含まれていれば良い）' do
      @item.price = 'abc'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid')
    end

    it '価格が9_999_999円を超えると出品できない' do
      @item.price = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid')
    end

    it '価格が空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'カテゴリーがなければ無効である' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it '状態がなければ無効である' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end

    it '送料負担がなければ無効である' do
      @item.shipping_fee_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee status must be other than 1')
    end

    it '都道府県がなければ無効である' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it '配送予定がなければ無効である' do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Scheduled delivery must be other than 1')
    end

    it '画像がなければ出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'userが紐付いていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
