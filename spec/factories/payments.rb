# spec/factories/payments.rb
FactoryBot.define do
  factory :payment do
    sequence(:name) { |n| "Cat#{n} Pay" }
    amount { rand(10..1000).to_f }
    author { association(:user) }
    categories { [association(:category)] }
  end
end
