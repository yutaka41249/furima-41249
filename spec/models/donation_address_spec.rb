require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @donation_address = FactoryBot.build(:donation_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '内容に問題がない場合' do
      it 'すべての情報が正しく入力されていれば保存できること' do
        expect(@donation_address).to be_valid
      end

      it 'building_nameが空でも保存できること' do
        @donation_address.building_name = ''
        expect(@donation_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では保存できないこと' do
        @donation_address.postal_code = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @donation_address.postal_code = '1234567'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県を選択していないと保存できないこと' do
        @donation_address.prefecture_id = 1
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では保存できないこと' do
        @donation_address.city = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存できないこと' do
        @donation_address.house_number = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空では保存できないこと' do
        @donation_address.phone_number = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁以上11桁以内の半角数値でないと保存できないこと' do
        @donation_address.phone_number = '090-1234-5678'
        @donation_address.valid?
