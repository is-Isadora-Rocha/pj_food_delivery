class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  belongs_to :address
  belongs_to :coupon, optional: true
  belongs_to :courier, class_name: 'User', optional: true

  has_many :order_items, dependent: :destroy
  has_one :payment_intent, dependent: :destroy

  enum status: { pending: 0, confirmed: 1, in_preparation: 2, out_for_delivery: 3, delivered: 4, canceled: 5 }
  enum payment_method: { pix: 0, card: 1, cash: 2 }
  enum payment_status: { pending: 0, paid: 1, refunded: 2, failed: 3 }
end
