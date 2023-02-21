class CommentsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@comments = Comment.all
		render json: @comments
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			render json: { id: @comment.id, message: "Comment created successfully" }, status: :created
		else
			render json: { error: "Failed to create Comment" }, status: :unprocessable_entity
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:commenter, :comment)
	end
end
