class Group < ApplicationRecord

	has_many :group_users, dependents: :destroy
	has_many :group_events, dependents: :destroy

end
