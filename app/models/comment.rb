class Comment < ApplicationRecord

	belongs_to :event

	validates :comment, presence: true, length: { maximum:400 }
end
