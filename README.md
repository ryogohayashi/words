# README
# ツール・ライブラリの名前
 
words（英単語登録・暗記アプリ）
 
## 簡単な説明
 
単語暗記アプリです。主な使用用途は英単語の暗記を想定しています。
随時追加実装予定。 

## 機能
 
- 機能1　単語帳の登録
- 機能2　単語の登録
- 機能3　単語検索機能
 
## 必要要件
 
- 特になし
 
## 使い方
 
1. ユーザー登録
2. 単語帳の登録（基本的には資格別の登録を想定しています。）
3. 単語の登録（各資格試験の頻出単語を登録しましょう。）
 
## インストール
 
```
$ git clone https://github.com/ryogohayashi/words.git
$ cd words
$ sh setup.sh
 
## 作者

https://github.com/ryogohayashi/words.git

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