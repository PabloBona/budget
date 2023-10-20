# spec/factories/categories.rb
FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Cat #{n}" }
    icon { '🍔' }
    user
  end
end
