FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    kana_last_name        { Gimei.last.katakana }
    kana_first_name       { Gimei.first.katakana }
    birth_date            { '1996-07-18' }
  end
end
