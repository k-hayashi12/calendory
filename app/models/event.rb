class Event < ApplicationRecord

	belongs_to :user
	has_many :photos, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :event_title, presence: true
end
