# My Diary

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

### 概要:
* 日記を作成し、マイページに表示されるカレンダーで過去のものを振り返ることができる。
* また、作成の際に公開/非公開が選択でき、公開されたものはコミュニティから閲覧することができる。
* 公開/非公開を問わず、TwitterやLINEへの共有も可能。

### URL: 
* http://54.199.89.104/

### テスト用アカウント
* email:sample@sample.com
* password:sample1234

### Basic認証
* ID:admin
* password:2222

### 利用方法
### 目指した課題解決
### 洗い出した要件
### 実装した機能
### 今後実装予定の機能

### データベース設計
## usersテーブル
| Column           | Type        | Options    |
|------------------|-------------|------------|
| nickname         | string      |null: false |
| email            | string      |null: false |
| password         | string      |null: false |

### Association
- has_many :diaries
- has_many :comments
- has_many :anniversaries

## diariesテーブル
| Column          | Type        | Options                      |
|-----------------|-------------|------------------------------|
| title           | string      |null: false                   |
| content         | text        |null: false                   |
| open            | integer     |                              |
| start_time      | date        |null: false                   |
| user_id         | integer     |null: false,foreign_key: true |

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
| Column   | Type    | Options                      |
|----------|---------|------------------------------|
| comment  | text    |                              |
| diary_id | integer |null: false,foreign_key: true |
| user_id  | integer |null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :diary

## anniversariesテーブル
| Column       | Type    | Options                      |
|--------------|---------|------------------------------|
| anniversary  | date    |null: false                   |
| name         | string  |null: false                   |
| user_id      | integer |null: false,foreign_key: true |

- belongs_to :user