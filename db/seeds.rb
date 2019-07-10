# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.create(title: "I love Apple", content: "Apple is the best. Much impressed.", stock_id: 1, user_id: 1)

Stock.create(symbol: "AAPL")
Stock.create(symbol: "MSFT")
Stock.create(symbol:"HPQ")
Stock.create(symbol: "EBAY")
Stock.create(symbol: "NFLX")
Stock.create(symbol: "FB")
Stock.create(symbol: "CRM")
Stock.create(symbol: "SMAR")
Stock.create(symbol: "SPLK")
Stock.create(symbol: "AMZN")
Stock.create(symbol: "WDAY")
Stock.create(symbol: "ACN")
Stock.create(symbol: "SAP")
Stock.create(symbol: "ZG")
Stock.create(symbol: "GDDY")
Stock.create(symbol: "NVDA")
Stock.create(symbol: "INTU")
Stock.create(symbol: "ADBE")
Stock.create(symbol: "VMW")
Stock.create(symbol: "CSCO")

5. times do
    User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      username: Faker::Nation.nationality,
      password_digest: "1234")
end

100. times do
  Comment.create(
    title: Faker::ElectricalComponents.electromechanical,
    content: Faker::Lorem.paragraph(2),
    user_id: rand(1..5),
    stock_id: rand(1..20))
end
