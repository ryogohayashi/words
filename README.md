# README
# ツール・ライブラリの名前
 
Anki（英単語登録・暗記アプリ）

<img width="1080" alt="Anki①" src="https://user-images.githubusercontent.com/60648197/83815091-7731ab00-a6fa-11ea-9a82-99d9eb490fe2.png">

## 簡単な説明
 
知識の海でどっぷりと暗記してみませんか？
Ankiは語学学習での単語暗記をサポートするアプリです。
覚えたい単語、忘れたくない単語で自作の単語帳を作りたいってときありますよね。
Ankiはあなたの自作単語張作成をお手伝い致します！
UI/UXを意識して日々アップデート中・・・

## 機能
 
- 機能1　単語帳の登録★試験別・分野別の単語張を自作する時に便利です！
- 機能2　単語の登録★jQueryを用いたAjaxでの非同期通信を実装しているため、スピーディでストレスなく登録できます！
- 機能3　単語検索機能★jQueryを用いたAjaxでのインクリメンタルサーチを実装しているため、膨大な登録数になってもすぐに検索できます！
- 機能4　ユーザー登録機能
- 機能5　ドラッグ・アンド・ドロップ機能★追加実装：jQuery-UIを用いて、登録した単語の並び替えができます！覚えたい単語を上に持ってくるなど使い方の幅が広がります！
- 機能６ 単語編集機能★追加実装：modalを用いて編集機能を実装！一度登録した単語をページ遷移せずに気軽に編集できます！
- 機能７　csv出力機能★追加実装：登録した単語をcsvに出力させる機能。紙ベースで持ち出したい時に大変便利です！
<img width="1440" alt="Anki②" src="https://user-images.githubusercontent.com/60648197/83815317-e909f480-a6fa-11ea-8717-6e64c506c0df.png">

<img width="1440" alt="Anki③" src="https://user-images.githubusercontent.com/60648197/83815555-646ba600-a6fb-11ea-9a9a-411c19d3e667.png">

<img width="1440" alt="Anki④" src="https://user-images.githubusercontent.com/60648197/83982696-92ebba00-a963-11ea-8052-4443f27d4309.png">

<img width="1440" alt="Anki⑥" src="https://user-images.githubusercontent.com/60648197/84311028-8c488700-ab9d-11ea-846e-63aef5499acf.png">
 
## 必要要件
 
- 特になし
 
## 使い方
 
1. ユーザー登録
2. 単語帳の登録（基本的には資格別の登録を想定しています。）
3. 単語の登録（各資格試験の頻出単語を登録しましょう。）

## 使用言語
- ・フロント
    HTML,CSS

-　・バックエンド
    Ruby（ver 2.5.1）
    Ruby on Rails(ver 5.0.7.2)

## DB
- ・My SQL(Ver 14.14)
 
## インストール

$ git clone https://github.com/ryogohayashi/words.git
$ cd words
$ sh setup.sh
 
## 作者

https://github.com/ryogohayashi/words.git

# #words DB設計

usersテーブル
| Column | Type | Option |
| ------ | ---- | ------ |
| name | string | null: false |
| email | string | null: false |
| password | string | null: false |
Association
- has_many : words
- has_many : tags

wordsテーブル
| Column | Type | Option |
| ------ | ---- | ------ |
| word | string | null: false |
| meaning | string | null: false |
| sentence | string | null: false |
| image | string | null: false |
| users_id | integer | null: false, foreign_key: ture |
| tags_id | integer | null: false, foreign_key: ture |
Association
- belong_to : users
- has_many : words_tags
- has_many : tags, through: :words_tags

tagsテーブル
| Column | Type | Option |
| ------ | ---- | ------ |
| word class | string | null: true |
| users_id | integer | null: false, foreign_key: ture |
| words_id | integer | null: false, foreign_key: ture |
Association
- belong_to : users
- has_many : words_tags
- has_many : words, through: :words_tags

words_tagsテーブル
| Column | Type | Option |
| ------ | ---- | ------ |
| words_id | integer | null: false, foreign_key: ture |
| tags_id | integer | null: false, foreign_key: ture |
Association
- belong_to : words
- belong_to : tags