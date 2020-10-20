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
| price_id           | integer          | null:false                   |

-belongs_to :users
-has_one :comments
-has_one :sending_destination

comments テーブル
|  Column            |  Type            |  Options                     |
| -------------------| -----------------| -----------------------------|
| text               | text             | null:false                   |
| user               | reference        | null:false, foreign_key:true |
| item               | reference        | null:false, foreign_key:true |

-has_one :users
-has_one :items
-has_one :sending_destination


sending_destination テーブル
|  Column                      |  Type            |  Options                     |
| -----------------------------| -----------------| -----------------------------|
| post_code                    | string(7)        | null:false                   |
| prefecture_code              | integer          | null:false                   |
| city                         | string           | null:false                   |
| house_number                 | string           | null:false                   |
| build_number                 | string           |                              |
| phone_number                 | string           | null:false                   |

-has_one :users
-has_one :items
