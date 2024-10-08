class Product < ApplicationRecord
  has_one_attached :image # 画像添付機能を追加

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_days_id, numericality: { other_than: 1 }
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_days_id, presence: true
end
