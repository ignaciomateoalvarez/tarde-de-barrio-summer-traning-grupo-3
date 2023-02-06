FactoryBot.define do
  factory :user do
    name {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    email {Faker::Email.email}
    password {Faker::Password.password}
  end
end
