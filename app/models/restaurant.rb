class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :categories, dependent: :destroy
  has_many :menu_items, through: :categories
end
