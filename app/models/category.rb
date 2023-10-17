class Category < ApplicationRecord
  has_many :payment_categories, dependent: :destroy
  has_many :payments, through: :payment_categories, dependent: :destroy
end
