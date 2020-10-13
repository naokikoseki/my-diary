# My Diary

* Ruby version
ruby 2.6.5

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

### 概要:
* 日記を作成し、マイページに表示されるカレンダーで過去のものを振り返ることができる。
* また、作成の際に公開/非公開が選択でき、公開されたものはコミュニティから閲覧することができる。
* 公開/非公開を問わず、TwitterやLINEへの共有も可能。

### URL: 
* http://54.199.89.104/

### テスト用アカウント:
* email:sample@sample.com
* password:sample1234

### Basic認証:
* ID:admin
* password:2222

### 利用方法:
* nickname/email/passwordをユーザー情報として登録。ログインする際はemail/passwordを入力。
* マイページの「新規登録」から日記を作成する。その際にチェックボックスにチェックを入れるとアプリ上で他のユーザーも閲覧可能になる。
* 公開された日記を閲覧する際は、左上の「コミュニティ」を押すと公開されている日記の一覧が表示される。
* マイページのカレンダー/コミュニティに表示されている画像がリンクになっており、クリックすると詳細ページへ遷移。
* 詳細ページにSNS共有ボタンがあり、そこからTwitterやLINEに共有できる。
* ログインしているユーザーは、詳細ページから公開されている日記にコメントすることができる。

### 目指した課題解決:
* 既存の日記アプリやSNSを利用する際に、他者に見せないもの/他者と共有したいものをそれぞれ別のアプリケーションを利用する必要がある。
  そのデータの管理を一括にして、アプリケーションを切り替える手間を無くすことが本アプリケーションの目的である。

### 洗い出した要件:
### 実装した機能:
* ユーザー管理機能
* 一覧表示機能
* 新規作成機能
* 編集・削除機能
* 詳細表示機能
* SNS共有機能
* コミュニティ機能
* 検索機能

### 今後実装予定の機能:
* いいね機能:JavaScriptによる非同期でのいいね機能。
* 記念日機能:誕生日など大切な日を登録することでログインした際にお祝いする。
* タグ付け機能:公開設定の日記にタグをつけることができる。
* ニュース閲覧機能:スクレーピングによりYahoo!ニュースの閲覧を可能にする。

### データベース設計:
![ER図](../images/my-diary-ER.png "ER図")

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
| date         | date    |null: false                   |
| name         | string  |null: false                   |
| user_id      | integer |null: false,foreign_key: true |

- belongs_to :user