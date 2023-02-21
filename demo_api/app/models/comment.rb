class Comment < ApplicationRecord
	belongs_to :post
	belongs_to :user

	validates :commenter, presence: true
	validates :comment, presence: true
end
