class Event < ApplicationRecord

	belongs_to :user
	has_many :photos, dependents: :destroy
	has_many :comments, dependents: :destroy

end
