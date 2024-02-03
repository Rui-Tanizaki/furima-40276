FactoryBot.define do
  factory :item do
    association :user
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'testimages', 'sample.jpg'), 'image/jpeg') }
    item_name { "テスト商品" }
    item_info { "テスト商品の説明" }
    item_category_id { 2 } # 適切なカテゴリーIDを指定
    prefecture_id { 2 } # 適切な都道府県IDを指定
    item_sales_status_id { 2 } # 適切な販売ステータスIDを指定
    item_shipping_fee_status_id { 2 } # 適切な送料ステータスIDを指定
    item_scheduled_delivery_id { 2 } # 適切な配送日程IDを指定
    item_price { 1000 } # 適切な価格を指定
  end
end