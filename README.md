# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| birth_date         | string | null: false               |

### Association
- has_many :items
- has_many :purchase_record



## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| explanation        | text       | null: false                    |
| detail             | text       | null: false                    |
| delivery           | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :purchase_record


## purchase_record テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| item        | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :shipping_address



## shipping_address テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| post_code          | integer | null: false |
| prefectures        | string  | null: false |
| municipalities     | string  | null: false |
| address            | string  | null: false |
| building_name      | string  | null: false |
| telephone_number   | integer | null: false |

### Association
- belongs_to :purchase_record