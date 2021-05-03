# テーブル設計

## users テーブル

| Column             | Type     | Options                 |
| ------------------ | -------- | ----------------------- |
| nickname           | string   | null:false              |
| email              | string   | null:false, unique:true |
| encrypted_password | string   | null:false              |
| first_name         | string   | null:false              |
| family_name        | string   | null:false              |
| first_name_kana    | string   | null:false              |
| family_name_kana   | string   | null:false              |
| birthday           | date     | null:false              |

### Association

- has_many :items
- has_one  :purchase
- has_one  :delivery

## items テーブル

| Column         | Type       | Options                      |
| -------------- | ---------- | ---------------------------- |
| name           | string     | null:false                   |
| user_id        | references | null:false, foreign_key:true |
| product_detail | text       | null:false                   |
| price          | integer    | null:false                   |
| category       | integer    | null:false                   |
| status         | integer    | null:false                   |
| postage_payer  | integer    | null:false                   |
| shipping_area  | integer    | null:false                   |
| shipment       | integer    | null:false                   |

### Association

- belongs_to :user
- has_one    :purchase

## purchasesテーブル

| Column      | Type       | Options                      |
| ------------| -----------| -----------------------------|
| user_id     | references | null:false, foreign_key:true |
| customer_id | string     | null:false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item

## deliverysテーブル

| Column        | Type       | Options          |
| --------------| ---------- | ---------------- |
| user_id       | references | foreign_key:true |
| postal_code   | string     | null:false       |
| prefecture    | integer    | null:false       |
| city          | string     | null:false       |
| house_number  | string     | null:false       |
| building_name | string     |                  |
| phone_number  | string     | null:false       |

### Association

- belongs_to :user 