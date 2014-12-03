class AddMoneyToRides < ActiveRecord::Migration
  def change
    add_column :rides, :cost, :decimal
  end
end
