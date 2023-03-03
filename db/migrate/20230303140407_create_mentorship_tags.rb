class CreateMentorshipTags < ActiveRecord::Migration[7.0]
  def change
    create_table :mentorship_tags do |t|
      t.references :mentorship, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
