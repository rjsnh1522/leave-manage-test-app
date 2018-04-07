class CreateSystems < ActiveRecord::Migration[5.1]
  def change
    create_table :systems do |t|
    	t.integer  :max_leave,default:12
      t.timestamps
    end
  end
end
