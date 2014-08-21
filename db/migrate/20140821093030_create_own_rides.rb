class CreateOwnRides < ActiveRecord::Migration
  def change
    create_table :own_rides do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
