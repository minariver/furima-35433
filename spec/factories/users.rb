FactoryBot.define do
  factory :user do
    transient do
      name { Gimei.name }
    end
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    famiy_name { name.first.kanji }
    first_name { name.last.kanji }
    famiy_name_kana { name.first.katakana }
    first_name_kana { name.last.katakana }
    birthday { "2000-01-01" }
  end
end