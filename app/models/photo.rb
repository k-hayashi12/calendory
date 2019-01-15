class Photo < ApplicationRecord
	mount_uploader :photo_image_id, ImageUploader
	belongs_to :event

end
