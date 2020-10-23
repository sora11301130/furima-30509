FactoryBot.define do
  factory :user do
    nickname           {Faker::Name.initials(number: 2)}
    email              {Faker::Internet.free_email}
    password           {"1a#{Faker::Internet.password(min_length: 6)}"}
    password_confirmation       {password}
    birthday           { Faker::Date.birthday(min_age: 18, max_age: 65) }
    first_name         { Gimei.first.kanji }
    family_name        { Gimei.last.kanji }
    reading_first_name { Gimei.first.katakana }
    reading_family_name { Gimei.last.katakana }
  end
end

