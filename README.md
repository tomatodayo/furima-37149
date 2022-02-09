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
| birthday_year      |    integer   | null: false                    |
| birthday_month     |    integer   | null: false                    |
| birthday_day       |    integer   | null: false                    |

### Association
- has_many :products
- has_many :buys
- has_many :products, through: :buys 




## productsテーブル

|       Column       |     Type     |             Options            |
| ------------------ | ------------ | ------------------------------ |
| product_title      |    string    | null: false                    |
| product_concept    |     text     | null: false                    |
| product_category   |    integer   | null: false                    |
| product_situation  |    integer   | null: false                    |
| send_load          |    integer   | null: false                    |
| send_source_area   |    integer   | null: false                    |
| send_day           |    integer   | null: false                    |
| product_price      |    integer   | null: false                    |
| user               |  references  | null: false  foreign_key: true |

### Association
- has_one :buy
- has_one :user through: :buys
- belongs_to :user




## sendsテーブル

|       Column       |     Type     |             Options            |
| ------------------ | ------------ | ------------------------------ |
| post_code          |    string    | null: false                    |
| prefecture         |    integer   | null: false                    |
| city               |    string    | null: false                    |
| block              |    string    | null: false                    |
| building           |    string    |                                |
| buy                |  references  | null: false  foreign_key: true |

### Association
- belongs_to :buy




## buysテーブル

|       Column       |     Type     |             Options            |
| ------------------ | ------------ | ------------------------------ |
| product            |  references  | null: false  foreign_key: true |

### Association
- has_one :send
- belongs_to :product
- belongs_to :user
