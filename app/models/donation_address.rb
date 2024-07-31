class DonationAddress
  include ActiveModel::Model
  attr_accessor :price, :user_id, :postal_code, :prefecture, :city, :house_number, :building_name, :token

  with_options presence: true do
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1_000_000,
                              message: 'is invalid' }
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Must be 10 or 11 digits' }
    validates :token
  end
end
