class DonationAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Must be 10 or 11 digits' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(item_id:, user_id:)
    ShippingAddress.create(postal_code:, prefecture_id:, city:, address:, building:,
                           phone_number:, order_id: order.id)
  end
end
