class MenuItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category
  has_many :order_items
end
