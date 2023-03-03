class ChangePlace < ActiveRecord::Migration[7.0]
  def change
    rename_column :mentorships, :place, :address
  end
end
