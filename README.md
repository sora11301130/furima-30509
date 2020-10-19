users テーブル
|  Column            |  Type            |  Options         |
| -------------------| -----------------| -----------------|
| email              | string           | null:false       |
| password           | string           | null:false       |
| nickname           | string           | null:false       |
| first name         | text             | null:false       |
| family name        | text             | null:false       |
| reading first name | text             | null:false       |
| reading family name| text             | null:false       |
| birthday           | string           | null:false       |

-has_many :items
-has_many :comments

items テーブル
|  Column            |  Type            |  Options                     |
| -------------------| -----------------| -----------------------------|
| title              | string           | null:false                   |
| user               | reference        | null:false, foreign_key:true |
| status             | text             | null:false                   |
| category           | text             | null:false                   |
| cost               | string           | null:false                   |
| place              | text             | null:false                   |
| plan               | text             | null:false                   |
| price              | string           | null:false                   |

-has_one :users
-has_one :comments

comments テーブル
|  Column            |  Type            |  Options                     |
| -------------------| -----------------| -----------------------------|
| text               | text             | null:false                   |
| user               | reference        | null:false, foreign_key:true |
| item               | reference        | null:false, foreign_key:true |

-has_one :users
-has_one :items