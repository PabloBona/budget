class Category < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy

  def total_amount
    payments.sum(:amount)
  end
end
