class Group < ApplicationRecord

	has_many :group_events, dependent: :destroy
	has_many :groupe_users, dependent: :destroy
	has_many :users, through: :groupe_users

end
