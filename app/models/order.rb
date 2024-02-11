class Order < ApplicationRecord
  belongs_to :user_item
  has_one :user, through: :user_item
  has_one :item, through: :user_item
end