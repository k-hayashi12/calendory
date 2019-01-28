class GroupComment < ApplicationRecord

	belongs_to :group_event
	belongs_to :user

end
