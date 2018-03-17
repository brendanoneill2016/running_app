class RemoveColumns < ActiveRecord::Migration[5.1]
  
	def change
	remove_column :signups, :event_id
	end


end
