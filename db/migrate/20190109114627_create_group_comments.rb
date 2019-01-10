class CreateGroupComments < ActiveRecord::Migration[5.2]
  def change
    create_table :group_comments do |t|
      t.integer :group_event_id
      t.text :group_comment

      t.timestamps
    end
  end
end
