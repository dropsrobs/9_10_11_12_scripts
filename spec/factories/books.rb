FactoryGirl.define do
  factory :book do
    title 'Cool Book'
    edition { Faker::Number.digit }
  end
end
