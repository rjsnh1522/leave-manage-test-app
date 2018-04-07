class CreateLeaves < ActiveRecord::Migration[5.1]
  def change
    create_table :leaves do |t|
    	t.integer  :user_id
    	t.datetime :from_date
    	t.datetime :to_date
    	t.text     :reason
    	t.integer  :status,default:0
    	t.integer  :approved_by
      t.timestamps
    end
  end
end
