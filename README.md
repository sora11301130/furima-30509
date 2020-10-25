## users テーブル
|  Column            |  Type            |  Options         |
| -------------------| -----------------| -----------------|
| email              | string           | null:false       |
| password           | string           | null:false       |
| nickname           | string           | null:false       |
| first_name         | string           | null:false       |
| family_name        | string           | null:false       |
| reading_first_name | string           | null:false       |
| reading_family_name| string           | null:false       |
| birthday           | date             | null:false       |

-has_many :items
-has_many :comments
-has_many :orders

## items テーブル
|  Column            |  Type            |  Options                     |
| -------------------| -----------------| -----------------------------|
| title              | string           | null:false                   |
| user               | references       | null:false, foreign_key:true |
| status_id          | integer          | null:false                   |
| category_id        | integer          | null:false                   |
| cost_id            | integer          | null:false                   |
| prefecture_code_id | integer          | null:false                   |
| plan_id            | integer          | null:false                   |
| price              | integer          | null:false                   |
| description        | text             | null:false                   |

-belongs_to :user
-has_many :comments
-has_one :order

## comments テーブル
|  Column            |  Type            |  Options                     |
| -------------------| -----------------| -----------------------------|
| text               | text             | null:false                   |
| user               | references       | null:false, foreign_key:true |
| item               | references       | null:false, foreign_key:true |

-belongs_to :user
-belongs_to :item


## sending_destinations テーブル
|  Column                      |  Type            |  Options                |
| --------------------------------------------------------------------------|
| post_code               | string(7)        | null:false                   |
| prefecture_code_id      | integer          | null:false                   |
| city                    | string           | null:false                   |
| house_number            | string           | null:false                   |
| build_number            | string           |                              |
| phone_number            | string           | null:false                   |
| order                   | references       | null:false, foreign_key:true |

-belongs_to :order


## orders テーブル
|  Column                  |  Type            |  Options                     |
| -------------------------| -----------------|------------------------------|
| user                     | references       | null:false, foreign_key:true |
| item                     | references       | null:false, foreign_key:true |

-belongs_to :user
-belongs_to :item
-has_one :sending_destination