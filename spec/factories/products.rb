# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    title { Faker::Commerce.product_name } 
    description { Faker::Lorem.sentence(word_count: 3) }
    price { Faker::Commerce.price.to_i }
  end
end
