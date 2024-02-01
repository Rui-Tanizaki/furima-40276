FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name_last_kanji {"太郎"}
    name_first_kanji {"山田"}
    name_last_kana {"タロウ"}
    name_first_kana {"ヤマダ"}
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65).to_date }

  end
end