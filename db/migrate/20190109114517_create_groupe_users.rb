class CreateGroupeUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :groupe_users do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
