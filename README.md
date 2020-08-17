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
| date       | string | null: false |


### Association

- has_many :item_id
- has_many :comment

## comments テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| comment | string | null: false |
| user_id | string | null: false |
| item_id | string | null: false |


## items テーブル

| Column       | Type   | Options                        |
| ------------ | ------ | ------------------------------ |
| image        | string | null: false, foreign_key: true |
| name         | string | null: false, foreign_key: true |
| comment      | string | null: false, foreign_key: true |
| state        | string | null: false, foreign_key: true |
| item_id      | string | null: false, foreign_key: true |
| shipping fee | string | null: false, foreign_key: true |
| date         | string | null: false, foreign_key: true |
| price        | string | null: false, foreign_key: true |

### Association

- has_many :comment

## credits テーブル

| Column     | Type   | Options                        |
| ---------- | ------ | ------------------------------ |
| card       | string | null: false, foreign_key: true |
| expiration | string | null: false, foreign_key: true |
| security   | string | null: false, foreign_key: true |


## address テーブル

| Column     | Type   | Options                        |
| ---------- | ------ | ------------------------------ |
| postalcoad | string | null: false, foreign_key: true |
| prefecture | string | null: false, foreign_key: true |
| city       | string | null: false, foreign_key: true |
| address    | string | null: false, foreign_key: true |
| building   | string | null: false, foreign_key: true |
| phone      | string | null: false, foreign_key: true |