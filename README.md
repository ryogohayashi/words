# README
#words DB設計
## usersテーブル
| Column | Type | Option |
| ------ | ---- | ------ |
| name | string | null: false |
| email | string | null: false |
| password | string | null: false |
### Association
- has_many : words
- has_many : tags

## wordsテーブル
| Column | Type | Option |
| ------ | ---- | ------ |
| word | string | null: false |
| meaning | string | null: false |
| sentence | string | null: false |
| image | string | null: false |
| users_id | integer | null: false, foreign_key: ture |
| tags_id | integer | null: false, foreign_key: ture |
### Association
- belong_to : users
- has_many : words_tags
- has_many : tags, through: :words_tags

## tagsテーブル
| Column | Type | Option |
| ------ | ---- | ------ |
| word class | string | null: true |
| users_id | integer | null: false, foreign_key: ture |
| words_id | integer | null: false, foreign_key: ture |
### Association
- belong_to : users
- has_many : words_tags
- has_many : words, through: :words_tags

## words_tagsテーブル
| Column | Type | Option |
| ------ | ---- | ------ |
| words_id | integer | null: false, foreign_key: ture |
| tags_id | integer | null: false, foreign_key: ture |
### Association
- belong_to : words
- belong_to : tags