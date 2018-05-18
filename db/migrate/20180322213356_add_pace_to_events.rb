class AddPaceToEvents < ActiveRecord::Migration[5.1]
  
  def change
  	add_column :events, :pace, :string
  end
end


