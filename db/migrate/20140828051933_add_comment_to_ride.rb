class AddCommentToRide < ActiveRecord::Migration
  def change
    add_column :rides, :comment, :text
  end
end
