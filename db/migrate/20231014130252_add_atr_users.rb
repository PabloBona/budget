class AddAtrUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :birthday, :date
    add_column :users, :photo, :string
    add_column :users, :credit_card, :string
  end
end
