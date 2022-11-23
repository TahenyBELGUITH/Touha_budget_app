class Group < ApplicationRecord
  has_many :spendings, dependent: :delete_all
  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true, length: { maximum: 250 }
end
