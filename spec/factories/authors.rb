require 'faker'

FactoryGirl.define do
  factory :author do
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
  end

  factory :no_attr_author, class: Author do
    name nil
    surname nil
  end
end
