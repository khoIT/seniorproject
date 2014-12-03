class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :start
      t.string :destination
      t.datetime :start_time
      t.datetime :end_time
      t.integer :seats_left
      t.integer :driver_id
      t.timestamps
    end
  end
end
