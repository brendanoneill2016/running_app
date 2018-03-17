class CreateSignups < ActiveRecord::Migration[5.1]
  def change
    create_table :signups do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end

    add_index :signups, :user_id
    add_index :signups, :event_id

  end
end
