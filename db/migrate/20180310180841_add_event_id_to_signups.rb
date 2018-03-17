class AddEventIdToSignups < ActiveRecord::Migration[5.1]
  
  def change
  	add_reference :signups, :event, foreign_key: true
  end

end
