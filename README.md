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
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

#### アソシエーション

- has_many :items
- has_many :purchases

### Itemsテーブ

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| description| text       | null: false                    |
| price      | integer    | null: false                    |
| user_id    | references | null: false, foreign_key: true |

#### アソシエーション

- belongs_to :user
- has_one :purchase

### Purchasesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

#### アソシエーション

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

### ShippingAddressesテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| purchase_id | references | null: false, foreign_key: true |

#### アソシエーション

- belongs_to :purchase

