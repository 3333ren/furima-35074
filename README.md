# テーブル

## Users

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| first_name          | string  | null: false               |
| last_name           | string  | null: false               |
| first_name_furigana | string  | null: false               |
| last_name_furigana  | string  | null: false               |
| birthday            | date    | null: false               |

### Association

- has_many :items
- has_many :purchases



## Items

| Column          | Type       | Options                       |
| --------------- | ---------- | ------------------------------|
| name            | string     | null:false                    |
| describe        | text       | null:false                    |
| category_id     | integer    | null:false                    |
| condition_id    | integer    | null:false                    |
| shipping_fee_id | integer    | null:false                    |
| prefecture_id   | integer    | null:false                    |
| shipping_day_id | integer    | null:false                    |
| price           | integer    | null:false                    |
| user            | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase



## Purchases

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null:false, foreign_key: true |
| item   | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping



## Shippings

| column        | Type       | options
| ------------- | ---------- | ----------------------------- |
| postal_cord   | string     | null:false                    |
| prefecture_id | integer    | null:false                    |
| city          | string     | null:false                    |
| address       | string     | null:false                    |
| building      | string     |                               |
| telephone     | string     | null:false                    |
| purchase      | references | null:false, foreign_key: true |

### Association

- belongs_to :purchase