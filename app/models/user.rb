class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups
  has_many :spendings

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true
  validates :password, presence: true
end
