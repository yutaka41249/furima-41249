# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# FURIMA-41249
# このプロジェクトは、ユーザーが商品を出品・購入できるWebアプリケーションです。

## 必須機能

### - ユーザーのログイン機能
### - 商品出品 / 購入

## テーブル設計

### Usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

#### アソシエーション

- has_many :items
- has_many :orders

### Itemsテーブ

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| description    | text       | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| category_id    | integer    | null: false                    |
| condition_id   | integer    | null: false                    |
| shipping_fee_id| integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| scheduled_delivery_id| integer    | null: false                    |


#### アソシエーション

- belongs_to :user
- has_one :order

### Ordersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

#### アソシエーション

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

### ShippingAddressesテーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| postal_code   | string      | null: false                    |
| prefecture_id | integer     | null: false                    |
| city          | string      | null: false                    |
| address       | string      | null: false                    |
| building      | string      |                                |
| phone_number  | string      | null: false                    |
| purchase      | references  | null: false, foreign_key: true |

#### アソシエーション

- belongs_to :order

