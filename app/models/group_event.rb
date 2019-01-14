class GroupEvent < ApplicationRecord

	belongs_to :group
	has_many :group_photos, dependent: :destroy
	has_many :group_comments, dependent: :destroy

end
