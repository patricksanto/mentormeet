class AddMinibioToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :minibio, :text
  end
end
