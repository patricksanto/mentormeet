class AddPriceToMentorships < ActiveRecord::Migration[7.0]
  def change
    add_column :mentorships, :price, :integer
  end
end
