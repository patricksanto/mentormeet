class AddCalloutToMentorship < ActiveRecord::Migration[7.0]
  def change
    add_column :mentorships, :callout, :text
  end
end
