class CreatePaymentCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_categories do |t|
      t.references :payment, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
