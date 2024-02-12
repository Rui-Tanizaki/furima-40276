class Itemshippingfeestatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い(購入者負担)' },
    { id: 3, name: '送料込み(出品者負担)' }
  ]

  def self.find_by_id(id)
    find(id)
  end

  include ActiveHash::Associations
  has_many :items
end
