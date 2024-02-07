class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|

      t.string  :order_postcode,     null: false
      t.integer :prefecture_id,      null: false
      t.string  :order_city,         null: false
      t.string  :order_address,      null: false
      t.string  :order_building,     null: false
      t.string  :order_phone_number, null: false
      t.references :user,            null: false, foreign_key: true
      t.references :item,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
