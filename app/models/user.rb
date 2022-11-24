class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :delete_all
  has_many :spendings, dependent: :delete_all

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true
  validates :password, presence: true
end
