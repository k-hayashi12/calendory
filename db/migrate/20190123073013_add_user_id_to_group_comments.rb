class AddUserIdToGroupComments < ActiveRecord::Migration[5.2]
  def change
    add_column :group_comments, :user_id, :integer
  end
end
