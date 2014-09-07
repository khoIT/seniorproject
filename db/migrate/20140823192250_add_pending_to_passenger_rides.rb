class AddPendingToPassengerRides < ActiveRecord::Migration
  def change
    add_column :passenger_rides, :confirmed, :boolean
    add_column :passenger_rides, :paid, :boolean
  end
end
