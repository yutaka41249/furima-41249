FactoryBot.define do
  factory :item do
    name                  { 'Sample Item' }
    description           { 'This is a sample item.' }
    category_id           { 1 }
    condition_id          { 1 }
    shipping_fee_status_id { 1 }
    prefecture_id         { 1 }
    scheduled_delivery_id { 1 }
    price                 { 1000 }
    association :user
  end
end
