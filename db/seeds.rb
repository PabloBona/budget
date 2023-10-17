# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create!(name: "User1", email: "pablobonasera@gmail.com", password: "123123", confirmed_at: Time.now )
category1 = Category.create!(name: "Category1", icon: "Icon1")
payment1 = user1.payments.create!(name: "Payment1", amount: 1000)
PaymentCategory.create!(payment: payment1, category: category1)
category2 = Category.create!(name: "Category2", icon: "Icon2")
payment2 = user1.payments.create!(name: "Payment2", amount: 1000)
PaymentCategory.create!(payment: payment2, category: category2)


user2 = User.create!(name: "User2", email: "user2@example.com", password: "password", confirmed_at: Time.now)
category3 = Category.create!(name: "Category3", icon: "Icon3")
category4 = Category.create!(name: "Category4", icon: "Icon4")
payment3 = user2.payments.create!(name: "Payment3", amount: 1500)
payment4 = user2.payments.create!(name: "Payment4", amount: 2000)
PaymentCategory.create!(payment: payment3, category: category3)
PaymentCategory.create!(payment: payment4, category: category4)
