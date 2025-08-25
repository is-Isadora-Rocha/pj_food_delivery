class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # usuário tem muito ...
  # relacionamentos
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :addresses, dependent: :destroy

  # caso o user possa ser courier (entregador)
  has_many :deliveries, class_name: 'Order', foreign_key: 'courier_id'

  # caso o user possa ser dono de restaurante
  has_many :restaurants, dependent: :destroy

  # validações
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true


  enum role: { customer: 0, owner: 1, driver: 2, admin: 3 }
end
