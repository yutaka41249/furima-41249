FactoryBot.define do
  factory :product do
    name { 'Sample Product' }
    description { 'This is a sample product.' }
    price { 1000 }
    category_id { 1 }
    condition_id { 1 }
    shipping_fee_id { 1 }
    prefecture_id { 1 }
    shipping_days_id { 1 }

    after(:build) do |product|
      product.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png')), filename: 'test_image.png', content_type: 'image/png')


  end
end
