require 'faker'

FactoryGirl.define do
  factory :book do
    title 'Cool Book'
    edition { Faker::Number.digit }
  end

  factory :no_attr_book, class: Book do
    title nil
    edition nil
  end
end
