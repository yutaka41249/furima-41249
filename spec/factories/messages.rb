FactoryBot.define do
  factory :message do
    content { Faker::Lorem.sentence }
    association :user
    association :room

    before do
      @user = FactoryBot.build(:user)
    end
  end
end
