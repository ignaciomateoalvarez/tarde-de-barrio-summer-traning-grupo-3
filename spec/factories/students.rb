FactoryBot.define do
  factory :student do
    name { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    birthday { Faker::Date.birthday }
    address { Faker::Address.full_address }
    school_grade { Faker::Number.within(range: 0..2) }
    currently_studying { true }
    user { create(:user) }
  end
end
