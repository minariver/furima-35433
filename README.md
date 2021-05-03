# テーブル設計

## users テーブル

| Column           | Type     | Options  |
| ---------------- | -------- | -------- |
| nickname         | string   | NOT NULL |
| email            | string   | NOT NULL |
| password         | string   | NOT NULL |
| first_name       | string   | NOT NULL |
| family_name      | string   | NOT NULL |
| first_name_kana  | string   | NOT NULL |
| family_name_kana | string   | NOT NULL |
| birthday|        | datetime | NOT NULL |

### Association

- has_many items
- has one  purchases

## items テーブル

| Column         | Type       | Options  |
| -------------- | ---------- | ---------|
| name           | string     | NOT NULL |
| seller         | string     | NOT NULL |
| product_detail | text       | NOT NULL |
| price          | integer    | NOT NULL |
| category       | string     | NOT NULL |
| status         | string     | NOT NULL |
| postage_payer  | integer    | NOT NULL |
| shipping_area  | string     | NOT NULL |
| shipment       | datetime   | NOT NULL |
| items_image    |            | NOT NULL |

### Association

- belongs to users
- has one  purchases

## purchasesテーブル

| Column          | Type    | Options  |
| --------------- | ------- | -------- |
| card_number     | integer | NOT NULL |
| expiration_date | text    | NOT NULL |
| security_code   | integer | NOT NULL |

### Association

- belongs to users

## deliverysテーブル

| Column        | Type    | Options  |
| --------------| ------- | -------- |
| postal_code   | integer | NOT NULL |
| prefecture    | text    | NOT NULL |
| address       | text    | NOT NULL |
| building_name | text    |          |
| phone_number  | integer | NOT NULL |

### Association

- has one  purchases