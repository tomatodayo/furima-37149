FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
      transient do
        person {Gimei.name}
      end
    first_name { person.first.kanji}
    last_name { person.last.kanji}
    kana_first_name { person.first.katakana}
    kana_last_name { person.last.katakana}
    birth_day {Faker::Date.birthday}
  end
end