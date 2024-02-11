class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :user_item
  attr_accessor :token
end
