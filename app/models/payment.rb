class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User', inverse_of: :payments
  has_many :payment_categories, dependent: :destroy
  has_many :categories, through: :payment_categories

  validates :amount, presence: true
  validates :name, presence: true
end
