class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User', inverse_of: :payments
  has_many :categories, through: :payment_categories
  has_many :payment_categories, dependent: :destroy
end
