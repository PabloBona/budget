json.extract! payment, :id, :amount, :description, :category_id, :user_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
