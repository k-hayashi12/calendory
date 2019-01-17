class GroupPhoto < ApplicationRecord

	mount_uploader :group_photo_image_id, ImageUploader
	belongs_to :group_event

end
