FactoryBot.define do
  factory :item do
    name { 'Sample Item' }
    description { 'This is a sample item.' }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id { 2 }
    scheduled_delivery_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('public/images/test_image.png')), filename: 'test_image.png')
    end
  end
end
