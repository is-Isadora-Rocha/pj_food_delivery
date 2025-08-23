class CouponRedemption < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :coupon
end
