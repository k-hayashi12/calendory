class GroupEvent < ApplicationRecord

	belongs_to :group
	has_many :group_photos, dependents: :destroy
	has_many :group_comments, dependents: :destroy

end
