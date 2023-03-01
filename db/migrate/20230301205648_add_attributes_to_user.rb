class AddAttributesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :birthday, :date
    add_column :users, :city, :string
    add_column :users, :is_mentor, :boolean
    add_column :users, :bio, :text
  end
end
