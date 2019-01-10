class CreateGroupPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :group_photos do |t|
      t.integer :group_event_id
      t.string :group_photo_image_id

      t.timestamps
    end
  end
end
