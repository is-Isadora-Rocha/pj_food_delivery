class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :menu_items, :categories, :orders, :delivery_fee_rules, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
end
