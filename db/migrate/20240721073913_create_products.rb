class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_fee_id
      t.integer :prefecture_id
      t.integer :shipping_days_id

      t.timestamps
    end
  end
end
