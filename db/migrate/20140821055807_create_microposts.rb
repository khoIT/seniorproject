class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :start
      t.string :destination
      t.date :time
      t.integer :passengers_number
      t.timestamps
    end
  end
end
