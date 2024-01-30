## usersテーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| email              | string     | null: false unique: true |
| encrypted_password | string     | null: false              |
| nickname           | string     | null: false              |
| name_first_kanji   | string     | null: false              |
| name_first_kana    | string     | null: false              | 
| name_last_kanji    | string     | null: false              |
| name_last_kana     | string     | null: false              |
| birth_date         | date       | null: false              |


### Association
- has_many :items , :orders

## itemsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_name  | string     | null: false                    |
| item_info  | text       | null: false                    |
| item_price | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user

## ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| order_postcode     | text       | null: false                    | 
| order_city         | text       | null: false                    |
| order_address      | text       | null: false                    |
| order_building     | text       | null: false                    |
| order_phone_number | integer    | null: false                    |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user , :item