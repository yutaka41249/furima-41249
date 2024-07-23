FactoryBot.define do
  factory :product do
    name { 'Sample Product' }
    description { 'This is a sample product.' }
    price { 1000 }
    category_id { 1 }
    condition_id { 1 }
    shipping_fee_status_id { 1 }
    prefecture_id { 1 }
    scheduled_delivery_id { 1 }
  end
end
