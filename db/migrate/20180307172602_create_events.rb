class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :date
      t.string :time
      t.string :location

      t.timestamps
    end
  end
end
