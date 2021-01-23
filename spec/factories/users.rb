FactoryBot.define do
  factory :user do
    id                    { Faker::Number.number(digits: 1) }
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    kana_last_name        { Gimei.last.katakana }
    kana_first_name       { Gimei.first.katakana }
    birth_date            { '1996-07-18' }
  end
end
