# テーブル

## User

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| password            | integer | null: false               |
| first_name          | string  | null: false               |
| last_name           | string  | null: false               |
| first_name_furigana | string  | null: false               |
| last_name_furigana  | string  | null: false               |
| birthday            | integer | null: false               |

### Association

- has_many :items
- has_many :purchases



## Item

| Column        | Type       | Options                       |
| ------------- | ---------- | ------------------------------|
| name          | string     | null:false                    |
| describe      | text       | null:false                    |
| category      | string     | null:false                    |
| condition     | string     | null:false                    |
| shipping_fee  | integer    | null:false                    |
| prefecture    | string     | null:false                    |
| shipping_days | integer    | null:false                    |
| price         | integer    | null:false                    |
| user          | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase



## Purchase

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null:false, foreign_key: true |
| item   | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :item
- belongs_to :shipping



## Shipping

| column      | Type       | options
| ----------- | ---------- | ----------------------------- |
| postal_cord | integer    | null:false                    |
| prefecture  | string     | null:false                    |
| city        | string     | null:false                    |
| address     | integer    | null:false                    |
| telephone   | integer    | null:false                    |
| purchase    | references | null:false, foreign_key: true |

### Association

- has_one :purchase