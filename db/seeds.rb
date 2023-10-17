user1 = User.create!(name: "User1", email: "pablobonasera@gmail.com", password: "123123", confirmed_at: Time.now)
user2 = User.create!(name: "User2", email: "user2@example.com", password: "password", confirmed_at: Time.now)

category1 = user1.categories.create!(name: "Category1", icon: "Icon1")
payment1 = user1.payments.create!(name: "Payment1", amount: 1000)
PaymentCategory.create!(payment: payment1, category: category1)

category2 = user1.categories.create!(name: "Category2", icon: "Icon2")
payment2 = user1.payments.create!(name: "Payment2", amount: 1000)
PaymentCategory.create!(payment: payment2, category: category2)

category3 = user2.categories.create!(name: "Category3", icon: "Icon3")
payment3 = user2.payments.create!(name: "Payment3", amount: 1500)
PaymentCategory.create!(payment: payment3, category: category3)

category4 = user2.categories.create!(name: "Category4", icon: "Icon4")
payment4 = user2.payments.create!(name: "Payment4", amount: 2000)
PaymentCategory.create!(payment: payment4, category: category4)