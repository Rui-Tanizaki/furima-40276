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
- has_many :user_items
- belong_to :order

## itemsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_name  | string     | null: false                    |
| item_info  | text       | null: false                    |
| item_price | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
- has_many :user_items

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
- belongs_to :user

## user_itemsテーブル

| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| user_id  | integer | null: false ,foreignkey: true  | 
| items_id | integer | null: false ,foreignkey: true  |

- belongs_to :user , :item