class AddPendingToPassengerRides < ActiveRecord::Migration
  def change
    add_column :passenger_rides, :confirmed, :boolean
  end
end
