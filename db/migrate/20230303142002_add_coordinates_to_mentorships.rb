class AddCoordinatesToMentorships < ActiveRecord::Migration[7.0]
  def change
    add_column :mentorships, :latitude, :float
    add_column :mentorships, :longitude, :float
  end
end
