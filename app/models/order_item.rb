class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  # Exemplo: quantidade de pizzas, hamburgueres etc
  validates :quantity, numericality: { greater_than: 0 }
end
