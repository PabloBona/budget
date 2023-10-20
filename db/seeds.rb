user1 = User.create!(
  name: "user1",
  email: "user1@gmail.com",
  password: "123123",
  password_confirmation: "123123"
)

user2 = User.create!(
  name: "user2",
  email: "user2@gmail.com",
  password: "123123",
  password_confirmation: "123123"
)

categories_user1 = []
ICONS.each_with_index do |icon, index|
  categories_user1 << Category.create!(
    name: "Cat#{index + 1}",
    icon: icon,
    user: user1
  )
end


categories_user1.each do |category|
  5.times do
    Payment.create!(
      name: "Pay #{category.name}",
      amount: rand(10..1000).to_f,
      author: user1,
      categories: [category]
    )
  end
end

categories_user2 = []
ICONS.each_with_index do |icon, index|
  categories_user2 << Category.create!(
    name: "Cat#{index + 1}",
    icon: icon,
    user: user2
  )
end


categories_user2.each do |category|
  3.times do
    Payment.create!(
      name: "Pago de #{category.name}",
      amount: rand(10..1000).to_f,
      author: user2,
      categories: [category]
    )
  end
end

