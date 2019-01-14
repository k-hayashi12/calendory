class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def show
		@event = Event.find(params[:id])
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.event_id = 5
		@comment.save
		redirect_to event_path(@comment.event_id)
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def comment_params
		params.require(:comment).permit(:comment)
	end

end
