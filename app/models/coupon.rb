class Coupon < ApplicationRecord
  belongs_to :restaurant

  has_many :orders
  has_many :coupon_redemptions
  has_many :users, through: :coupon_redemptions
end
