class AddGoogleMapsToEvents < ActiveRecord::Migration[5.1]
  def change
  	add_column :events, :google_maps, :string
  end
end
