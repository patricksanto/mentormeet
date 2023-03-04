class AddDefaultValueToIsAccepted < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :is_accepted, :boolean, default: false
  end
end
