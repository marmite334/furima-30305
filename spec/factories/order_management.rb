FactoryBot.define do
  factory :order_management do
    item_id                { 1 }
    user_id                { 3 }
    token                  { 'tok_abcdefghijk00000000000000000' }
    postal_code            { '289-2114' }
    prefecture_id          { 12 }
    municipalities         { '匝瑳市' }
    address                { '八日市場イ' }
    building               { '八日市場駅' }
    phone_number           { "11_111_111_111" }
    purchase_management_id { 1 }
  end
end
