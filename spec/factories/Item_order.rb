FactoryBot.define do
  factory :item_order do
    token { "tok_abcdefghijk00000000000000000" }
    order_postcode { "000-0000" }
    prefecture_id { 2 }
    order_city { "試験市" }
    order_address { "0-0-0" }
    order_building {"試験ビル101"}
    order_phone_number { "00000000000" }
  end
end