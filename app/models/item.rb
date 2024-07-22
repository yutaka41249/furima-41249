class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_status_id, presence: true
  validates :prefecture_id, presence: true
end
