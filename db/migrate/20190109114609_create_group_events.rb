class CreateGroupEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :group_events do |t|
      t.integer :group_id
      t.string :group_event_title
      t.datetime :start_time

      t.timestamps
    end
  end
end
