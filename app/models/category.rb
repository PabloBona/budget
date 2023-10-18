class Category < ApplicationRecord
  belongs_to :user
  has_many :payment_categories, dependent: :destroy
  has_many :payments, through: :payment_categories, dependent: :destroy

  validates :name, presence: true
  validates_length_of :name, maximum: 10
  validates :icon, presence: true
end
