FactoryBot.define do
  factory :item do
    name          { Faker::Commerce.department                }
    explanation   { Faker::Commerce.product_name              }
    price         { Faker::Number.within(range: 300..9_999_999) }
    category_id   { Faker::Number.within(range: 2..11)        }
    state_id      { Faker::Number.within(range: 2..7)         }
    charges_id    { Faker::Number.within(range: 2..3)         }
    prefecture_id { Faker::Number.within(range: 2..48)        }
    days_id       { Faker::Number.within(range: 2..4)         }
    association :user
  end
end
