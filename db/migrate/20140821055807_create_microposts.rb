class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :start
      t.string :destination
      t.datetime :time
      t.integer :seats_left
      t.integer :own_ride_id
      t.timestamps
    end
  end
end
