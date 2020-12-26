FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initals(number:2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.Password(min_length: 6)}
    password_confirmation {password}
    last_name             {gimei.last.kanji}
    first_name            {gimei.first.kanji}
    kana_last_name        {gimei.last.katakana}
    kana_first_name       {gimei.first.katakana}
    birth_date            {'1996-07-18'}
  end
end
