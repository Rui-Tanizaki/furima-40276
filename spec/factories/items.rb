FactoryBot.define do
  factory :item do
    association :user, factory: :user
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'testimages', 'sample.jpg'), 'image/jpeg') }
    item_name { 'テスト商品' }
    item_info { 'テスト商品の説明' }
    item_category_id { 2 }
    prefecture_id { 2 }
    item_sales_status_id { 2 }
    item_shipping_fee_status_id { 2 }
    item_scheduled_delivery_id { 2 }
    item_price { 1000 }
  end
end
