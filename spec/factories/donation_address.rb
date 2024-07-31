# spec/factories/donation_addresses.rb
FactoryBot.define do
  factory :donation_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { 'Sample City' }
    address { 'Sample Address' }
    building_name { 'Sample Building' }
    phone_number { '09012345678' }
    token { 'sample_token' }
  end
end
