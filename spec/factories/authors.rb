FactoryGirl.define do
  factory :author do
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
  end
end
