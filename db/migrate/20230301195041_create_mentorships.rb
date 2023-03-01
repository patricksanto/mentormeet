class CreateMentorships < ActiveRecord::Migration[7.0]
  def change
    create_table :mentorships do |t|
      t.string :title
      t.text :content
      t.string :place
      t.boolean :is_remote
      t.boolean :is_hybrid
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
