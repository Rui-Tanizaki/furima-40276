class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :prefecture
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_scheduled_delivery

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
end
