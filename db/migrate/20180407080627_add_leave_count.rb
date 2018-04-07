class AddLeaveCount < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :add_leave_count,:integer,default: 0
  end
end
