# テーブル設計


## usersテーブル

|       Column       |     Type     |             Options            |
| ------------------ | ------------ | ------------------------------ |
| email              |    string    | null: false  unique: true      |
| encrypted_password |    string    | null: false                    |
| name               |    string    | null: false                    |
| phone_number       |    string    | null: false                    |


### Association
- has_many :products
- has_many :buys
- has_many :products, through: :buys 




## productsテーブル

|       Column       |     Type     |             Options            |
| ------------------ | ------------ | ------------------------------ |
| product_title      |    string    | null: false                    |
| product_concept    |     text     | null: false                    |
| user_id            |  references  | null: false  foreign_key: true |

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
| building           |    string    | null: false                    |
| user_id            |  references  | null: false  foreign_key: true |
| buy_id             |  references  | null: false  foreign_key: true |



### Association
- belongs_to :buy



## buysテーブル

|       Column       |     Type     |             Options            |
| ------------------ | ------------ | ------------------------------ |
| user_id            |  references  | null: false  foreign_key: true |
| buy_id             |  references  | null: false  foreign_key: true |
| send_id            |  references  | null: false  foreign_key: true |

### Association
- has_one :send
- has_many :product
- belongs_to :user
