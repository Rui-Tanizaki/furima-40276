class Order < ApplicationRecord
  belongs_to :user_item
  has_one :user, through: :user_item
  has_one :item, through: :user_item

  #attr_accessor :token

  #validates :token, presence: true

  #with_options presence: true do
    #validates :order_postcode, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    #validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    #validates :order_city
    #validates :order_address
    #validates :order_phone_number, format: { with: /\A\d{10,11}\z/, message: "is too short" }
    #validates :order_phone_number, numericality: { only_integer: true, message: "is invalid. Input only number" }
  #end
end