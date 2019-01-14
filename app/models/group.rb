class Group < ApplicationRecord

	has_many :group_users, dependent: :destroy
	has_many :group_events, dependent: :destroy

end
