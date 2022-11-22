class Spending < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :amount, presence: true
  validates :name, presence: true, length: { maximum: 50 }
end
