FactoryBot.define do
  factory :order do
    association :user, factory: :user
    association :item, factory: :item
    token {"tok_abcdefghijk00000000000000000"}
    order_postcode {"000-0000"}
    prefecture_id {2}
    order_city {"試験市"}
    order_address {"0-0-0"}
    order_phone_number {"00000000000"}
  end
end