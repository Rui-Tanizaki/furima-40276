class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :user_item
  attr_accessor :token
  
  validates :token, presence: true
  validates :order_postcode, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :order_city, presence: true
  validates :order_address, presence: true
  validates :order_phone_number, presence: true
  validates :order_phone_number, format: { with: /\A\d{10,11}\z/, message: "is too short" }
  validates :order_phone_number, numericality: { only_integer: true, message: "is invalid. Input only number" }
end
