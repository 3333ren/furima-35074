FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password = 'abc123'
    password { password }
    password_confirmation { password }
    first_name { '太朗' }
    last_name { '山田' }
    first_name_furigana { 'タロウ' }
    last_name_furigana { 'ヤマダ' }
    birthday { Faker::Date.birthday }
  end
end
