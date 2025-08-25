class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # usuário tem muito ...
  has_many :restaurants, dependent: nullify
  has_many :orders, dependent: :nullify
  has_many :carts, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy
  has_one  :driver_profile, dependent: :destroy
  has_many :notifications, dependent: :destroy


  enum role: { customer: 0, owner: 1, driver: 2, admin: 3 }
end
