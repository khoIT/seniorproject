class CreatePassengerRides < ActiveRecord::Migration
  def change
    create_table :passenger_rides do |t|
      t.integer :ride_id
      t.integer :passenger_id

      t.timestamps
    end
  end
end
