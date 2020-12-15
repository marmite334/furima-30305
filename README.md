# README

# usersテーブル
| Column   | Type   | Options    |
|----------|--------|------------|
| nickname | string | null:false |
| email    | string | null:false |
| password | string | null:false |

### Association
_ has_one  :identification
_ has_many :items

# identificationsテーブル
| Column          | Type       | Options                       |
|-----------------|------------|-------------------------------|
| first_name      | string     | null:false                    |
| last_name       | string     | null:false                    |
| kana_first_name | string     | null:false                    |
| kana_last_name  | string     | null:false                    |
| birth_date      | integer    | null:false                    |
| user            | references | null:false, foreign_key: true |

### Association
_ belongs_to :user

# itemsテーブル
| Column      | Type       | Options                       |
|-------------|------------|-------------------------------|
| name        | string     | null:false                    |
| explanation | text       | null:false                    |
| price       | integer    | null:false                    |
| category    | integer    | null:false                    |
| state       | integer    | null:false                    |
| charges     | integer    | null:false                    |
| area        | integer    | null:false                    |
| days        | integer    | null:false                    |
| user        | references | null:false, foreign_key: true |

### Association
_ has_one  :credit_card
_ has_one  :shipping_area
_ belongs_to :user

# credit_cardsテーブル
| Column        | Type       | Options           |
|---------------|------------|-------------------|
| information   | integer    | null:false        |
| month         | integer    | null:false        |
| year          | integer    | null:false        |
| security_code | integer    | null:false        |
| item          | references | foreign_key: true |

### Association
_ belongs_to :item

# shipping_areasテーブル
| Column         | Type       | Options           |
|----------------|------------|-------------------|
| postal_code    | integer    | null:false        |
| prefectures    | integer    | null:false        |
| municipalities | string     | null:false        |
| address        | string     | null:false        |
| building       | string     |                   |
| phone_number   | integer    | null:false        |
| item           | references | foreign_key: true |

### Association
_ belongs_to :item
