FactoryBot.define do
  factory :user do
    nickname { 'Sample User' }
    email { 'sample@example.com' }
    password { 'password1' }
    password_confirmation { 'password1' }
    last_name { '山田' } # 全角（漢字・ひらがな・カタカナ）で正しい値に修正
    first_name { '太郎' } # 全角（漢字・ひらがな・カタカナ）で正しい値に修正
    last_name_kana { 'ヤマダ' } # 全角カタカナで正しい値に修正
    first_name_kana { 'タロウ' } # 全角カタカナで正しい値に修正
    birth_date { '2000-01-01' }
  end
end
