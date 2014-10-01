class ModifyTimeRide < ActiveRecord::Migration
  def self.up
    rename_column :rides, :time, :start_time
    add_column :rides, :end_time, :datetime
  end

  def self.down
  end
end
