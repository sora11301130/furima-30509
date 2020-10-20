users テーブル
|  Column            |  Type            |  Options         |
| -------------------| -----------------| -----------------|
| email              | string           | null:false       |
| password           | string           | null:false       |
| nickname           | string           | null:false       |
| first name         | string           | null:false       |
| family name        | string           | null:false       |
| reading first name | string           | null:false       |
| reading family name| string           | null:false       |
| birthday           | date             | null:false       |

-has_many :items
-has_many :comments
-has_one :sending_destination
-has_many :orders

items テーブル
|  Column            |  Type            |  Options                     |
| -------------------| -----------------| -----------------------------|
| title              | string           | null:false                   |
| user               | reference        | null:false, foreign_key:true |
| status_id          | integer          | null:false                   |
| category_id        | integer          | null:false                   |
| cost_id            | integer          | null:false                   |
| place_id           | integer          | null:false                   |
| plan_id            | integer          | null:false                   |
| price              | integer          | null:false                   |

-belongs_to :user
-has_many :comments
-has_one :sending_destination
-has_one :order

comments テーブル
|  Column            |  Type            |  Options                     |
| -------------------| -----------------| -----------------------------|
| text               | text             | null:false                   |
| user               | reference        | null:false, foreign_key:true |
| item               | reference        | null:false, foreign_key:true |

-belongs_to :user
-has_one :item
-has_one :sending_destination


sending_destinations テーブル
|  Column                      |  Type            |  Options                     |
| -----------------------------| -----------------| -----------------------------|
| post_code                    | string(7)        | null:false                   |
| prefecture_code              | integer          | null:false                   |
| city                         | string           | null:false                   |
| house_number                 | string           | null:false                   |
| build_number                 | string           |                              |
| phone_number                 | string           | null:false                   |

-belongs_to :user
-has_one :item


orders テーブル
|  Column                      |  Type            |  Options                     |
| -----------------------------| -----------------| -----------------------------|
| users                        | reference        | null:false, foreign_key:true |
| items                        | reference        | null:false, foreign_key:true |
-belongs_to :user
-has_one :item