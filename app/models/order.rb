class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  belongs_to :address
  belongs_to :coupon
end
