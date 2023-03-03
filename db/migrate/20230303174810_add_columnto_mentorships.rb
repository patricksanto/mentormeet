class AddColumntoMentorships < ActiveRecord::Migration[7.0]
  def change
    add_column :mentorships, :tags, :string, array: true, default: []
  end
end
