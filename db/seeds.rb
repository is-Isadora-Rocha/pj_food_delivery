# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# USERS
owner = User.find_or_create_by!(email: 'owner@example.com') do |user|
  user.password = '123456'
  user.role = :owner
end

customer = User.find_or_create_by!(email: 'customer@example.com') do |user|
  user.password = '123456'
  user.role = :customer
end

# RESTAURANT
rest = Restaurant.find_or_create_by!(user: owner, name: 'Pizzaria da Isa') do |r|
  r.description = 'A melhor!'
  r.phone = '11999999999'
  r.active = true
  r.opening_time = '18:00'
  r.closing_time = '23:59'
  r.min_order_value = 20
end

# CATEGORIES
pizzas = Category.find_or_create_by!(restaurant: rest, name: 'Pizzas') do |c|
  c.position = 1
end

bebidas = Category.find_or_create_by!(restaurant: rest, name: 'Bebidas') do |c|
  c.position = 2
end

# MENU ITEMS
m1 = MenuItem.find_or_create_by!(restaurant: rest, category: pizzas, name: 'Mussarela') do |mi|
  mi.description = 'Clássica'
  mi.price = 39.9
  mi.available = true
end

m2 = MenuItem.find_or_create_by!(restaurant: rest, category: pizzas, name: 'Calabresa') do |mi|
  mi.description = 'Top'
  mi.price = 44.9
  mi.available = true
end

# ADDRESS
addr = Address.find_or_create_by!(addressable: customer, cep: '01001-000', street: 'Praça da Sé', number: '100') do |a|
  a.neighborhood = 'Sé'
  a.city = 'São Paulo'
  a.state = 'SP'
end

# CART & CART ITEMS
cart = Cart.find_or_create_by!(user: customer, restaurant: rest, status: :active)

CartItem.find_or_create_by!(cart: cart, menu_item: m1) do |ci|
  ci.quantity = 1
  ci.unit_price = m1.price
end

CartItem.find_or_create_by!(cart: cart, menu_item: m2) do |ci|
  ci.quantity = 2
  ci.unit_price = m2.price
end
