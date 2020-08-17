# README

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| birthday | string | null: false |

### Association

- has_many :item_id
- has_many :comment

## comments テーブル

| Column  | Type   | Options     |
| ------  | ------ | ----------- |
| comment | string | null: false |
| user_id | string | null: false |
| item_id | string | null: false |


## items テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| image        | references | null: false, foreign_key: true |
| name         | references | null: false, foreign_key: true |
| comment      | references | null: false, foreign_key: true |
| state        | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |
| shipping fee | references | null: false, foreign_key: true |
| date         | references | null: false, foreign_key: true |
| price        | references | null: false, foreign_key: true |

### Association

- has_many :comment