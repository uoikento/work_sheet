# Work_sheet
## 概要
コミュニティ内に向けたアンケートアプリ
管理者が認めたユーザーのみが質問を作成でき、一般ユーザーは質問に対して投票し結果を閲覧できる
- デプロイ先
http://52.68.45.179
注）拝見される場合、認証が必要になります。
別書にてパスワードを記載しておりますので、お手数ですがご確認いただければと思います。

## 制作背景
全員が初対面のチーム開発においてチームとしての課題を知るまでに時間がかかってしまった。原因はコミュニケーション不足だと感じ、どういったメンバーのチームか事前に知ることができれば早期の課題発見に繋がるのではと考え、アンケートアプリ制作に至った。
## DEMO
https://gyazo.com/37682d4a376e9ecd7d7be849f6bd8459
## 工夫したポイント
集計結果のグラフ化 
## 開発環境
ruby 2.5.1 
rails 5.2.4 
DB:mysql 

aws 
アプリケーションサーバー:unicorn 
webサーバー:nginx 
自動デプロイ:capistrano 

## 今後の課題
ユーザーアカウントに階級の概念を持たせること 
質問者アカウントでの検索機能
より効率的なDB設計とそれに伴ったアンケートの集計に関するコードのリファクタリング 
# DB設計
## User
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
has_many: questions

## Qustion
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|user_id|references|foreign_key: true|
### Association
has_many: options
has_many: votes
belongs_to: user
accepts_nested_attributes_for :options

## Option
|Column|Type|Options|
|------|----|-------|
|title|string||
|question_id|references|foreign_key: true|
### Association
has_many: votes
belongs_to: question

## Vote
|Column|Type|Options|
|------|----|-------|
|role|integer||
|question_id|references|foreign_key: true|
|option_id|references|foreign_key: true|
roleにはenumを使用
### Association
belongs_to: question
belongs_to: option

