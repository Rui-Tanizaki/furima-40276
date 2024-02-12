class Item < ApplicationRecord
  belongs_to :user
  has_one :user_item
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options unless: -> { new_record? } do
    validates :image, presence: true
  end

  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
