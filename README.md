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

items テーブル
|  Column            |  Type            |  Options                     |
| -------------------| -----------------| -----------------------------|
| title              | string           | null:false                   |
| user               | reference        | null:false, foreign_key:true |
| status             | integer          | null:false                   |
| category           | integer          | null:false                   |
| cost               | integer          | null:false                   |
| place              | integer          | null:false                   |
| plan               | integer          | null:false                   |
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