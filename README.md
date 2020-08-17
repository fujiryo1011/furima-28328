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
| comment | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |


## items テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| image        | string | null: false |
| name         | string | null: false |
| comment      | string | null: false |
| state        | string | null: false |
| shipping fee | string | null: false |
| date         | string | null: false |
| price        | string | null: false |

### Association

- has_many :comments


## address テーブル

| Column     | Type    | Options                        |
| ---------- | ------- | ------------------------------ |
| postalcoad | string  | null: false                    |
| prefecture | integer | null: false, foreign_key: true |
| city       | string  | null: false                    |
| address    | string  | null: false                    |
| building   | string  | null: false                    |
| phone      | string  | null: false                    |