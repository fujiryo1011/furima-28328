# README

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| firstname  | string | null: false |
| lastname   | string | null: false |
| first-name | string | null: false |
| last-name  | string | null: false |
| birthday   | date   | null: false |

### Association

- has_many :items
- has_many :comments


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


## items テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| image   | string | null: false |
| name    | string | null: false |
| comment | text   | null: false |
| price   | string | null: false |

### Association

- has_many :comments


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

- has_many :user


## buyer テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_many :