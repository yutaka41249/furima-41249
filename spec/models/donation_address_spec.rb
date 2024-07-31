require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  before do
    @donation_address = FactoryBot.build(:donation_address)
  end

  describe '商品購入機能' do
    context '内容に問題がない場合' do
      it 'すべての情報が正しく入力されていれば保存できること' do
        expect(@donation_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では保存できないこと' do
        @donation_address.postal_code = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Postal code can't be blank")
      end

      # 他のバリデーションテストも同様に記述
    end
  end
end
