class GroupComment < ApplicationRecord

	belongs_to :group_event
	belongs_to :user

	validates :group_comment, presence: true, length: { maximum:400 }

end
