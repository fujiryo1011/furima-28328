# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| firstname       | string | null: false |
| lastname        | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :buyers
- has_many :addresses


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| name         | string     | null: false                    |
| comment      | text       | null: false                    |
| state        | integer    | null: false                    |
| shipping_fee | integer    | null: false                    |
| date         | integer    | null: false                    |
| category     | string     | null: false                    |
| price        | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_many :buyers
- belongs_to :user


## address テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| postalcoad | string     | null: false |
| prefecture | integer    | null: false |
| city       | string     | null: false |
| address    | string     | null: false |
| building   | string     | null: true  |
| phone      | string     | null: false |
| buyer      | references | null: false |

### Association

- belongs_to :buyers


## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_many :addresses
- belongs_to :user
- belongs_to :item