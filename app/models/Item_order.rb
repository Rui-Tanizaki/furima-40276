class ItemOrder
  include ActiveModel::Model
  attr_accessor :token,:order_postcode, :prefecture_id, :order_city, :order_address, :order_phone_number, :order_building, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :order_postcode, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :order_city
    validates :order_address
    validates :order_phone_number, length: { minimum: 10, maximum: 11, message: "is too short" }, format: { with: /\A\d+\z/, message: "is invalid. Input only number" }
  end

    validate :validate_phone_number_length

  def save
    user_item = UserItem.create(
      user_id: user_id,
      item_id: item_id,
    )
  
    if user_item.persisted?
      order = Order.create(
        order_postcode: order_postcode,
        prefecture_id: prefecture_id,
        order_city: order_city,
        order_address: order_address,
        order_building: order_building,
        order_phone_number: order_phone_number,
        user_item_id: user_item.id
      )

      unless order.persisted?
        # Order.create が失敗した場合、エラーをログに出力
        errors.merge!(order.errors)
        Rails.logger.error("Order.create failed with errors: #{order.errors.full_messages}")
        return false
      end
    else
      errors.merge!(user_item.errors)
      return false
    end
  end
  
  private
  def validate_phone_number_length
    if order_phone_number.length >= 12
      errors.add(:order_phone_number, "is too long")
    end
  end
end