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

## usersテーブル
| Column           | Type        | Options    |
|---------------------------------------------|
| nickname         | string      |null: false |
| email            | string      |null: false |
| password         | string      |null: false |

### Association
-has_many :diaries
-has_many :comments
-has_many :anniversaries

## diariesテーブル
| Column          | Type        | Options                      |
|--------------------------------------------------------------|
| title           | string      |null: false                   |
| content         | text        |null: false                   |
| open            | integer     |                              |
| start_time      | date        |null: false                   |
| user_id         | integer     |null: false,foreign_key: true |

### Association
-belongs_to :user
-has_many :comments

## commentsテーブル
| Column   | Type    | Options                      |
|---------------------------------------------------|
| comment  | text    |                              |
| diary_id | integer |null: false,foreign_key: true |
| user_id  | integer |null: false,foreign_key: true |

### Association
-belongs_to :user
-belongs_to :diary

## anniversariesテーブル
| Column       | Type    | Options                      |
|-------------------------------------------------------|
| anniversary  | date    |null: false                   |
| name         | string  |null: false                   |
| user_id      | integer |null: false,foreign_key: true |

-belongs_to :user

## likesテーブル
| Column       | Type    | Options                      |
|-------------------------------------------------------|
| diary_id     | integer |null: false,foreign_key: true |
| user_id      | integer |null: false,foreign_key: true |


