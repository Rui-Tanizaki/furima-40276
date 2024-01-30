## usersテーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| email              | string     | null: false unique: true |
| encrypted-password | string     | null: false              |
| nickname           | string     | null: false              | 
| name-kanji         | string     | null: false              |
| name-kana          | string     | null: false              |
| birthday           | string     | null: false              |


### Association
- has_many :item , :order

## itemsテーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item-name                | string     | null: false                    |
| item-info                | text       | null: false                    |
| item-category            | string     | null: false                    | 
| item-sales-status        | text       | null: false                    |
| item-shipping-fee-status | string     | null: false                    |
| item-prefecture          | string     | null: false                    |
| item-scheduled-delivery  | string     | null: false                    |
| item-price               | string     | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association
- has_many :order
- belongs_to :users

## ordersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| card-day            | string     | null: false                    |
| card-code           | string     | null: false                    |
| order-postcode      | text       | null: false                    | 
| order-prefecture    | text       | null: false                    |
| order-city | string | text       | null: false                    |
| order-streetaddress | text       | null: false                    |
| order-residence     | text       | null: false                    |
| order-tel-no        | string     | null: false                    |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :users , :items