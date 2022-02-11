# テーブル設計


## usersテーブル

|       Column       |     Type     |             Options            |
| ------------------ | ------------ | ------------------------------ |
| nickname           |    string    | null: false                    |
| email              |    string    | null: false  unique: true      |
| encrypted_password |    string    | null: false                    |
| first_name         |    string    | null: false                    |
| last_name          |    string    | null: false                    |
| kana_first_name    |    string    | null: false                    |
| kana_last_name     |    string    | null: false                    |
| birth_day          |    date      | null: false                    |

### Association
- has_many :products
- has_many :buys




## productsテーブル

|        Column        |     Type     |             Options            |
| -------------------- | ------------ | ------------------------------ |
| product_title        |    string    | null: false                    |
| product_concept      |     text     | null: false                    |
| product_category_id  |    integer   | null: false                    |
| product_situation_id |    integer   | null: false                    |
| send_load_id         |    integer   | null: false                    |
| send_source_area_id  |    integer   | null: false                    |
| send_day_id          |    integer   | null: false                    |
| product_price        |    integer   | null: false                    |
| user                 |  references  | null: false  foreign_key: true |

### Association
- belongs_to :user
- has_one :buy




## sendsテーブル

|       Column       |     Type     |             Options            |
| ------------------ | ------------ | ------------------------------ |
| post_code          |    string    | null: false                    |
| prefecture_id      |    integer   | null: false                    |
| city               |    string    | null: false                    |
| block              |    string    | null: false                    |
| building           |    string    |                                |
| phone_number       |    string    | null: false                    |
| buy                |  references  | null: false  foreign_key: true |

### Association
- belongs_to :buy




## buysテーブル

|       Column       |     Type     |             Options            |
| ------------------ | ------------ | ------------------------------ |
| product            |  references  | null: false  foreign_key: true |
| user               |  references  | null: false  foreign_key: true |

### Association
- has_one :send
- belongs_to :product
- belongs_to :user
