class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.boolean :is_accepted
      t.references :user, null: false, foreign_key: true
      t.references :mentorship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
