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
| state        | text       | null: false                    |
| shipping fee | text       | null: false                    |
| date         | text       | null: false                    |
| category     | string     | null: false                    |
| price        | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_many :images
- belongs_to :user


## address テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| postalcoad | string  | null: false |
| prefecture | integer | null: false |
| city       | string  | null: false |
| address    | string  | null: false |
| building   | string  | null: false |
| phone      | string  | null: false |

### Association

- has_many :buyers


## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item