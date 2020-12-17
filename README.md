# README

# usersテーブル
| Column             | Type   | Options    |
|--------------------|--------|------------|
| nickname           | string | null:false |
| email              | string | null:false |
| encrypted_password | string | null:false |
| first_name         | string | null:false |
| last_name          | string | null:false |
| kana_first_name    | string | null:false |
| kana_last_name     | string | null:false |
| birth_date         | date   | null:false |

### Association
_ has_many :items
_ has_many :purchase_managements

# itemsテーブル
| Column              | Type       | Options                       |
|---------------------|------------|-------------------------------|
| name                | string     | null:false                    |
| explanation         | text       | null:false                    |
| price               | integer    | null:false                    |
| category_id         | integer    | null:false                    |
| state_id            | integer    | null:false                    |
| charges_id          | integer    | null:false                    |
| area_id             | integer    | null:false                    |
| days_id             | integer    | null:false                    |
| user                | references | null:false, foreign_key: true |

### Association
_ belongs_to :user
_ belongs_to :purchase_management

# purchase_managementsテーブル
| Column         | Type       | Options                       |
|----------------|------------|-------------------------------|
| item           | references | null:false, foreign_key: true |
| item_user      | references | null:false, foreign_key: true |
| purchased_user | references | null:false, foreign_key: true |
| shipping_area  | references | null:false, foreign_key: true |

### Association
_ belongs_to :user
_ belongs_to :item
_ has_one :shipping_area

# shipping_areasテーブル
| Column              | Type       | Options                       |
|---------------------|------------|-------------------------------|
| postal_code         | string     | null:false                    |
| prefectures_id      | integer    | null:false                    |
| municipalities      | string     | null:false                    |
| address             | string     | null:false                    |
| building            | string     |                               |
| phone_number        | string     | null:false                    |
| purchase_management | references | null:false, foreign_key: true |

### Association
_ belongs_to :purchase_management
