# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#owner = User.create!(email: 'owner@example.com', password: '123456', role: :owner)
#customer = User.create!(email: 'customer@example.com', password: '123456', role: :customer)

owner = User.find_or_create_by!(email: 'owner@example.com') do |user|
  user.password = '123456'
  user.role = :owner
end

customer = User.find_or_create_by!(email: 'customer@example.com') do |user|
  user.password = '123456'
  user.role = :customer
end

rest = Restaurant.create!(user: owner, name: 'Pizzaria da Isa', description: 'A melhor!',
                          phone: '11999999999', active: true,
                          opening_time: '18:00', closing_time: '23:59', min_order_value: 20)

Category.create!(restaurant: rest, name: 'Pizzas', position: 1)
Category.create!(restaurant: rest, name: 'Bebidas', position: 2)

m1 = MenuItem.create!(restaurant: rest, category: rest.categories.first, name: 'Mussarela',
                      description: 'Clássica', price: 39.9, available: true)
m2 = MenuItem.create!(restaurant: rest, category: rest.categories.first, name: 'Calabresa',
                      description: 'Top', price: 44.9, available: true)

addr = Address.create!(addressable: customer, cep: '01001-000', street: 'Praça da Sé',
                       number: '100', neighborhood: 'Sé', city: 'São Paulo', state: 'SP')

cart = Cart.create!(user: customer, restaurant: rest, status: :active)
CartItem.create!(cart: cart, menu_item: m1, quantity: 1, unit_price: m1.price)
CartItem.create!(cart: cart, menu_item: m2, quantity: 2, unit_price: m2.price)
